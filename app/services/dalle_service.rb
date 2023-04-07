require 'openai'

class DalleService
  def initialize(client)
    @client = client
  end

  def content_image(coupon)
    prompt = "Create an image of a coupon with the title #{coupon.product_name} and the description #{coupon.product_description}."

    response = @client.images.generate(
      parameters: {
        prompt: prompt, size: "256x256"
    })

    return response.dig("data", 0, "url")
  end
end
