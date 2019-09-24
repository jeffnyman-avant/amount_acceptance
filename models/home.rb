class Home
  include Testable

  url_is Config.context["url"]

  link :check_loan_options, class: "outline", href: "/apply"
  link :check_loan_options_big, id: "apply-now-link"

  link :borrow, id: "drop1"
  link :credit_cards, title: "Credit Cards", href: "/apply?product_type=credit_card"

  def begin_with
    move_to(0, 0)
    resize_to(screen_width, screen_height)
  end

  def start_personal_loan_application
    check_loan_options.flash(color: "red", delay: 0.5, flashes: 2)
    check_loan_options.click
  end

  def start_credit_card_application
    borrow.flash(color: "red", delay: 0.5, flashes: 2)
    borrow.click

    credit_cards.flash(color: "red", delay: 0.5, flashes: 2)
    credit_cards.click
  end
end
