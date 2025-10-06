// Defining a data model.
class Instructions {
  index string
  steps string[]
  content string?
}

template_string InstructionTmpl(instructions: Instructions[]) #"
  {% for instruction in instructions %}

  ## Stepwise Instructions for Index #{{ instruction.index }}:

  {% for step in instruction.steps %}
  - {{ step }}
  {% endfor %}

  ### Additional Instructions for Index #{{ instruction.index }}

  {% if instruction.content is defined and instruction.content | default('') | trim %}
  {{ instruction.content }}
  {% else %}
  *No additional instructions found for index {{ instruction.index }}*
  {% endif %}

  {% endfor %}
"#

// Create a function to extract the text from a string.
function GetOutput(user_name: string, additional_constraint: string, instructions: Instructions[]) -> string {
  client CustomGPT5Mini
  prompt #"
    **Role:** You are a super cleaver ai assistant

    **Task:** Say hello world like a programmer to {{ user_name }}

    **Stepwise Instructions:**

    1. Interpret and rewrite user's query.
    2. Think of a plan to solve the query.
    3. Generate a response based on the plan.

    {{InstructionTmpl(instructions)}}

    **Constraints:**
      - Please use simple words.

    **Hint:** Try not to talk about code. {{ additional_constraint }}

    {{ ctx.output_format }}
  "#
}



// Test the function with a sample example. Open the VSCode playground to run this.
test getoutput {
  functions [GetOutput]
  args {
    user_name "rjoydip"
    additional_constraint ""
    instructions [
      {
        index "01"
        steps [
          "Hello, from article 1!"
          "This is additional step for article 1"
        ]
      }
      {
        index "03"
        steps [
          "Hello, from article 3!"
          "This is additional step for article 3"
        ]
      }
      {
        index "04"
        steps [
          "Hello, from article 4!"
          "This is additional step for article 4"
        ]
      }
    ]
  }
}
