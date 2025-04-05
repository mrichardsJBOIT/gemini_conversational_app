# Project Description

## Gemini Conversational Chatbot

This project is a simple Ruby web application that allows you to have conversations with Google's Gemini API. 
It uses the Sinatra web framework, the `dotenv` gem for managing environment variables, and the `net/http` and `json` libraries for making HTTP requests and parsing JSON responses.

All code was generated in a RubyMine IDE using the following tools:
* **Google Code Assist**
* **GitHub CoPilot**
* **Amazon Q**

## Features

*   **Conversational Chat:** Interact with Google's Gemini API to generate text-based responses.
*   **Text Summarization:** The application can summarize text input using the Gemini API.
*   **Environment Variables:** Uses the `dotenv` gem to manage API keys and other configuration settings.
*   **Simple Web Interface:** A basic HTML form allows you to input text and view the responses.
*   **Text Formatting:** Basic text formatting (paragraphs and line breaks) is applied to the Gemini responses.
*   **Gemini Model:** The application uses the `gemini-2.0-flash` model.

## Requirements

*   Ruby (version 3.0 or higher recommended)
*   Bundler
*   A Google Cloud project with a Gemini API key
*   A `.env` file with the relevant credentials
*   Sinatra

## Installation
1. Clone the repository.
2. Run `bundle install` to install dependencies.

    *  Edit the `.env` file and add your Gemini API key:
    *  Replace `"your_gemini_api_key_here"` with your actual Gemini API key.
    *  Replace `your-gcp-project-id` with your Google Cloud Project ID.
    *  You can change the `GOOGLE_CLOUD_LOCATION` if needed.

3. **Enable the Vertex AI API:**
    * Go to the Google Cloud Console: https://console.cloud.google.com/
    * Select Your Project.
    * Navigate to the API Library: In the left-hand navigation menu, go to "APIs & Services" -> "Library."
    * Search for "Vertex AI API": In the search bar, type "Vertex AI API" and select the "Vertex AI API" result.
    * Enable the API: If the API is not enabled, you'll see an "Enable" button. Click it.

## Usage
1. Start the application using `ruby app.rb`.
2. Visit `http://localhost:4567` in your browser.

## Directory Structure
\- `app.rb` \- Main application entry point  
\- `.env-example` \- Sample environment file  
\- `Gemfile`/\`Gemfile.lock` \- Manages project dependencies  
\- `README.md` \- This file

## License
Use this project as needed.