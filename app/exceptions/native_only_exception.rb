class NativeOnlyException < StandardError
  def initialize
    super("This page is only accessible by Turbo Native")
  end
end
