class Comment < ApplicationRecord
  belongs_to :article

  after_save :notify_article_author

  private

  def notify_article_author
    puts "Comentario guardado: Notificando al autor del artículo..."
  end
end