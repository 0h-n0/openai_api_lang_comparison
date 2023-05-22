import { Configuration, OpenAIApi } from "openai";

async function main() {    
    const configuration = new Configuration({
    apiKey: process.env.OPENAI_API_KEY,
    });
    const openai = new OpenAIApi(configuration);

    const completion = await openai.createCompletion({
    model: "text-davinci-003",
    prompt: "hello",
    temperature: 0.0
    });
    console.log(completion.data.choices[0].text);
}
main();