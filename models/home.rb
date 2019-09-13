class Home
  include Testable

  url_is Config.context["url"]

  link :check_loan_options, class: "outline", href: "/apply"
  link :check_loan_options_big, id: "apply-now-link"

  def begin_with
    move_to(0, 0)
    resize_to(screen_width, screen_height)
  end

  def start_personal_loan_application
    check_loan_options.flash(color: "red", delay: 0.5, flashes: 2)
    check_loan_options.click
  end
end
