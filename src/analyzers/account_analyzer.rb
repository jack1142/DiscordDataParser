class AccountAnalyzer
    def initialize(path, params)
        @path = path
        @params = params
    end

    def call
        account_details = JSON.parse File.read "#{@path}/user.json"
        {
            output_files: [],
            misc_data: {
                avatarextension: "png", #nitro?, figure out way to detect type
                avatarpath: "#{@path}/avatar.png" #is it always called avatar?
            },
            output_data: {
                username: account_details['username'],
                usertag: account_details['discriminator'],
                email: account_details['email']
            }
        }
    end
end

