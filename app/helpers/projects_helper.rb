module ProjectsHelper

  # Returns the project title and open ticket count (if any).
  def project_summary(project)
    summary = sanitize(project.title)
    summary.tap do |s|
      count = project.open_tickets.count
      s << (' '.html_safe + content_tag(:span, count, class: 'badge')) if count > 0
    end
  end
end
