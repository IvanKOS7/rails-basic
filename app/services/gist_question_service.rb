class GistQuestionService
  attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_GIST_TOKEN'])
  end

  def call
    #Faraday
    #@client.create_gist(gist_params)
    #Octokit
    begin
      @client.create_gist(options = gist_params)
    rescue => e
      #я здесь ловлю ошибку Октокита, чтобы приложение не крашилось
      #Невалидный токен например
      #сообщение выводится в флеше и работа продолжается
      e
    end
  end

  def success?
    self.client.last_response.status.eql?(201)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
                'test-guru-question.txt' => {
                content: gist_content
                                            }
             }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end


end
