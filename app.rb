require 'sinatra'
require 'erb'
helpers do
  include ERB::Util
end
require 'net/http'
require 'json'
require 'dotenv/load'

helpers do
  include ERB::Util

  def simple_format(text, html_options={})
    text = text.to_s.dup
    text.gsub!(/\r\n?/, "\n")
    text.gsub!(/\n\n+/, "</p>\n\n<p>")
    text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br>')

    html_options_string = html_options.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
    "<p #{html_options_string}>#{text}</p>"
  end
end


class GeminiService
  BASE_URI = "https://generativelanguage.googleapis.com/v1beta/models/"

  def self.summarise(...)
    new.summarise(...)
  end

  def initialize(token: ENV["GEMINI_TOKEN"], model: ENV["GEMINI_MODEL"])
    @token, @model = token, model
  end

  def summarise(text, length: " as many sentences as required.")
    response = generate_content(
      contents: [{
        parts: [{ text: "Summarise this in #{length}: #{text}"}]
      }]
    )
    response.dig("candidates", 0, "content", "parts", 0, "text")
  end

  def generate_content(args)
    post "generateContent", body: args
  end

  def post(path, body:, headers: {"content-type": "application/json"})
    url = URI("#{BASE_URI}#{@model}:#{path}?key=#{@token}")
    data = JSON.dump(body)
    response = Net::HTTP.post(url, data, headers)
    JSON.parse(response.body)
  end

end

get '/' do
  erb :index
end

post '/chat' do
  user_input = params[:user_input]
  @gemini_response = GeminiService.summarise(user_input)
  erb :index
end
