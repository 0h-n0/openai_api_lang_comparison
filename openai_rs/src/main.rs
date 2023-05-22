use chatgpt::prelude::*;
use chatgpt::types::CompletionResponse;
use tokio;

#[tokio::main]
async fn main() -> Result<()> {
    let api_token = std::env::var("OPENAI_API_KEY")?;
    let client = ChatGPT::new(api_token)?;
    let response: CompletionResponse = client
        .send_message("hello")
        .await?;

    println!("Response: {}", response.message().content);
    Ok(())
}