class Sentence < ApplicationRecord
    belongs_to :review
    belongs_to :business_owner, through: :review

    # Runs IBM sentiment analysis
    # def self.run_api_analysis
    #     uri = URI.parse("https://gateway.watsonplatform.net/natural-language-understanding/api/v1/analyze?version=2017-02-27&text=I%20still%20have%20a%20dream%2C%20a%20dream%20deeply%20rooted%20in%20the%20American%20dream%20%E2%80%93%20one%20day%20this%20nation%20will%20rise%20up%20and%20live%20up%20to%20its%20creed%2C%20%22We%20hold%20these%20truths%20to%20be%20self%20evident%3A%20that%20all%20men%20are%20created%20equal.&features=sentiment,keywords")
    #     request = Net::HTTP::Get.new(uri)
    #     request.basic_auth("5d047b97-caec-4304-a13b-ae28a9740c56", "WYmQLD06Ibra")

    #     req_options = {
    #       use_ssl: uri.scheme == "https",
    #     }

    #     response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    #     http.request(request)

    #     render :json => response.body
    #     puts response.body
    # end

end
end