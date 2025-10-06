import { b } from "./baml_client"
import type { Instructions } from "./baml_client/types"

async function ExampleStream(user_name: string, additional_constraint: string = "", instructions: Instructions[]): Promise<string> {
    const stream = b.stream.GetOutput(user_name, additional_constraint, instructions);
    for await (const msg of stream) {
        console.log(msg)
    }
    return await stream.getFinalResponse();
}

async function main() {
    const instructions = [
        {
            "index": "01",
            "steps": [
                "Hello, from article 1!",
                "This is additional step for article 1",
            ],
        },
        {
            "index": "03",
            "steps": [
                "Hello, from article 3!",
                "This is additional step for article 3",
            ],
        },
        {
            "index": "04",
            "steps": [
                "Hello, from article 4!",
                "This is additional step for article 4",
            ],
        },
    ]
    await ExampleStream("rjoydip", "", instructions)
}

main().catch(e => console.error(e))