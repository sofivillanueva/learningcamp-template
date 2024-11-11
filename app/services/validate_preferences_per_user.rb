class ValidatePreferencesPerUser
    def initialize(user_id)
        @user = User.find_by(id: user_id)
    end

    def call
        check_valid_amount_of_preferences
    end

    private

    def check_valid_amount_of_preferences
        is_valid = false
        if @user.preferences.size < 5
            is_valid = true
        end
        return is_valid
    end
end