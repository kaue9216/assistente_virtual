class User < ApplicationRecord
  def content
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "Você é um atendente da agencia Kanka, e vai responder a solicitação a seguir de maneira muiti resumida, comece a interação com 'olá #{username}' e termine com 'o que acha de batermos um papo presencialmente?'e lembre-se que o usuário não pode saber que é o chat GPT que está respondendo ele. Preciso da sua ajuda, tenho uma conta com o nome de #{username}, ela tem #{folowers} e uma média de #{likes} likes por publicação, meu objetivo é #{obj}."}]
    })
    return chatgpt_response["choices"][0]["message"]["content"]
  end
end
