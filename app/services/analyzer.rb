class Analyzer

    def initializer(sentence_object)

    end

    def run_api_analysis()
        url = self.sentence_content

        fake_sentence_id = 1

        response = RestClient::Request.execute method: :get, url: "https://gateway.watsonplatform.net/natural-language-understanding/api/v1/analyze?version=2017-02-27&text=I%20still%20have%20a%20dream%2C%20a%20dream%20deeply%20rooted%20in%20the%20American%20dream%20%E2%80%93%20one%20day%20this%20nation%20will%20rise%20up%20and%20live%20up%20to%20its%20creed%2C%20%22We%20hold%20these%20truths%20to%20be%20self%20evident%3A%20that%20all%20men%20are%20created%20equal.&features=sentiment,keywords", user: '5d047b97-caec-4304-a13b-ae28a9740c56', password: 'WYmQLD06Ibra'

        json_response = JSON.parse(response.body)
        self.sentence_id = fake_sentence_id
        sentiment_label = json_response["sentiment"]["document"]["label"]
        sentiment_score = json_response["sentiment"]["document"]["score"]
        puts sentiment_label
        puts sentiment_score
        self.sentiment_score = sentiment_score
        self.sentiment_label = sentiment_label

        # return (sentence_id, sentiment_label, sentiment_score)

    end

end