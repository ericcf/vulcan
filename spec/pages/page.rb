class Page

  attr_reader :page, :options

  def initialize(page, options = {})
    @page, @options = page, options
  end

  def alert(kind)
    page.find("div.alert-#{kind}").text.strip
  end
end
