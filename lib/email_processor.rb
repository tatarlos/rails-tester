# for grabbing and sorting email data

class EmailProcessor

  require 'net/pop'

  def self.process(email)
    Post.create!({ body: email.body, email: email.from })
  end

  def self.grab_email
    Net::POP3.start('pop.gmail.com', 995, 'haochen.hcliu@gmail.com', 'hhggdxceaistjbbr') do |pop|
      if pop.mails.empty?
        puts 'No mail.'
      else
        i = 0
        binding.pry
        pop.each_mail do |m|   # or "pop.mails.each ..."
          File.open("inbox/#{i}", 'w') do |f|
            f.write m.pop
          end
          m.delete
          i += 1
        end
        puts "#{pop.mails.size} mails popped."
      end
    end
  end
end
