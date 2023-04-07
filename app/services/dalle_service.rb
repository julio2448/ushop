require 'openai'

class DalleService
  def initialize(client)
    @client = client
  end

  def content_image(coupon)
    prompt = "Create an image of a coupon with the title #{title} and the description #{description}"

    response = @client.images.generate(
      parameters: {
        prompt: prompt, size: "200x200"
    })

    return response.dig("data", 0, "url")
  end
end
