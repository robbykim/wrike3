module Wrike3
  class Folder
    include Wrike3::Common

    def initialize(wrike)
      @wrike = wrike
    end

    def get_tree_all(folderable_type = nil, folderable_id = nil, params = {})
      wrike.execute(:get, api_url(nested_path('folders', folderable_type, folderable_id)), params)
    end

    def get_subtree(folder_id, params = {})
      wrike.execute(:get, api_url("folders/#{folder_id}/folders"), params)
    end

    # Get folder data
    def details(ids, params = {})
      wrike.execute(:get, api_url("folders/#{ids}"), params)
    end

    # create a folder
    def create(folder_id = nil, params = {})
      wrike_url = "folders#{(folder_id.present? ? "/#{folder_id}/folders" : '')}"
      wrike.execute(:post, api_url(wrike_url), params)
    end

    # Update a folder
    def update(id, params = {})
      wrike.execute(:put, api_url("folders/#{id}"), params)
    end

    # Delete folders and all descendants
    def delete(id, params = {})
      wrike.execute(:delete, api_url("folders/#{id}"), params)
    end
  end
end
