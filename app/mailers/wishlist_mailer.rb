class WishlistMailer < ActionMailer::Base
  default from: "santa@clause.com"

  def wishlist_email(wishlist)
    @user = wishlist.user
    @wishlist = wishlist
    mail(to: @user.email, subject: 'Fullfill some wishes!')
  end
end
