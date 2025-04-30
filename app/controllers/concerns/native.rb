module Native
  extend ActiveSupport::Concern

  included do
    layout "native"

    before_action :require_native_app

    private
      def require_native_app
        raise NativeOnlyException unless hotwire_native_app?
      end
  end
end
