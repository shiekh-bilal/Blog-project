class ArticleMailer < ApplicationMailer
    def new_article_notification(article)
      @article = article
      mail(to: 'your_mailtrap_inbox@example.com', subject: 'New Article Created')
    end
  
    def article_deleted_notification(article, user)
      @article = article
      @user = user
      mail(to: 'your_mailtrap_inbox@example.com', subject: 'Article Deleted')
    end
end
