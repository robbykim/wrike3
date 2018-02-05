module Wrike3
  class Custom
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def get_all(params = {})
      wrike.execute(:get, api_url("customfields"), params)
    end
  end
end
