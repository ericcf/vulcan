class ProjectPresenter < Presenter

  def self.alphabetized
    model_class.all(order: [:title])
  end
end
