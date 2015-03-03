module TranslationService::API

  class Translations

    TranslationStore = TranslationService::Store::Translation

    ## GET /translations/:community_id/
    def get(community_id, find_params = {})
      options = find_params.slice(:use_fallbacks)

      begin
        Result::Success.new(TranslationStore.get({
                              community_id: community_id,
                              translation_keys: Maybe(find_params[:translation_keys]).or_else(nil),
                              locales: Maybe(find_params[:locales]).or_else(nil),
                              options: options
                            }))
      rescue ArgumentError => error
        Result::Error.new(error.message)
      end
    end


    # POST /translations/:community_id/
    def create(community_id, translation_groups = [])

      begin
        Result::Success.new(TranslationStore.create({
                              community_id: community_id,
                              translation_groups: translation_groups
                            }))
      rescue ArgumentError => error
        Result::Error.new(error.message)
      end

    end

    # PUT /translations/:community_id/
    def update(community_id, translation_groups = [])
      raise NoMethodError.new("Not implemented")
    end

    # DELETE /translations/:community_id/
    def delete(community_id, translation_keys = [])

      begin
        Result::Success.new(TranslationStore.delete({
                              community_id: community_id,
                              translation_keys: translation_keys
                            }))
      rescue ArgumentError => error
        Result::Error.new(error.message)
      end

    end

  end
end