# == Route Map
#
#                    Prefix Verb URI Pattern                                                                              Controller#Action
#                      root GET  /                                                                                        welcome#index
#                post_index GET  /posts(.:format)                                                                         post#index
#           email_processor POST /email_processor(.:format)                                                               griddler/emails#create
#        rails_service_blob GET  /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET  /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET  /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT  /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/posts', to: 'post#index', as: 'post_index'
  post '/posts/get_new_email' , to: 'post#get_emails', as: 'get_emails'
  mount_griddler
end
