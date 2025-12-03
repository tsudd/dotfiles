return {
  model = "gpt-4o",
  temperature = 0.2,
  window = {
    layout = "vertical",
    width = 0.5,
  },
  auto_insert_mode = true,
  headers = {
    user = "Me",
    assistant = "Copilot",
    tool = "Tool",
  },
  prompts = {
    ChildInstructions = {
      prompt = "Explain in simple terms suitable for a child.",
      system_prompt = "You are an assistant that explains things in simple terms suitable for a child.",
      description = "Explain things in simple terms suitable for a child.",
    },
  },
}
