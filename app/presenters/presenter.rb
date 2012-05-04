require 'delegate'

class Presenter < SimpleDelegator

  def self.wrap(model_class)
    @@model_class = model_class

    self
  end

  def self.model_class
    @@model_class
  end

  def initialize(model)
    super(model)
  end

  def to_model
    __getobj__
  end

  def class
    __getobj__.class
  end
end
