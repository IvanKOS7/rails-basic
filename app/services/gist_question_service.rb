class GistQuestionService


  def initialize(question, client: nil)
		@question = question
		@test = @question.test
		@client = client || GitHubClient.new
  end


	def call
		@client.create_gist(gist_params)
	end

	private

	def gist_params
		#файл создаетс] в гисте на стороне сервера
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
		#выбираем каждый ответ и записываем в массив
		content += @question.answers.pluck(:body)
		content.join("\n")
	end

end
