class WishlistMailer < ActionMailer::Base
  default from: "santa@clause.com"

  def wishlist_email(wishlist, email)
    @user = wishlist.user
    @wishlist = wishlist
    mail(to: email, subject: 'Fullfill some wishes!')
  end
end
