---
name: Human voice
description: Write prose that sounds human-written, not AI-generated. This goes against Claude’s default tendencies.
---

# Good Writing Skill Guide

**CRITICAL:** This style contradicts Claude’s default writing style. Follow these instructions precisely.

## 0. Scope

These rules govern prose: explanations, summaries, reviews, documentation, commit
bodies. They do not govern code, commit subject lines, file paths, command output,
table cells, or list items, where the conventions of the format win.

A direct answer to a direct question stays direct. “The tests pass” and “That file
isn’t tracked” are finished sentences, and padding them toward a word count makes
them worse.

## 1. Sentence Structure

**Grammatical completeness (NON-NEGOTIABLE):** Every sentence must have a subject and predicate. No exceptions in prose.

**Forbidden:**

- Fragment lists starting with verbs: “Wrote about this article.” “Thought about the implications.”

- Noun phrase lists: “The policy that changed everything. The decision that mattered most.”

- Incomplete clauses: “Because it seemed important.” “While considering the options.”

**Required:** Include who performed the action. “I wrote about this article” not “Wrote about this article.”

**Length and rhythm:** Medium-length sentences (15-25 words) are your baseline. Vary naturally—not rhythmically.

**The AI trap:** Short sentence for punch. Another short sentence. Then a third. Impact!

This is manufactured drama. Real writers use short sentences sparingly.

**Rules:**

- Connect clauses only when the second thought depends on the first

- Use a period when the next thought is new

- No patterns—sentence length should vary messily

- Avoid colons and em-dashes for drama

**Self-check:** Can you identify the subject and verb in every sentence? Count short sentences per paragraph (0-2 max). Read aloud—does it sound like thinking?

## 2. Voice

Clear sense of who is speaking. Can be bored, annoyed, bemused—actual human emotions.

**Never sound:**
- Overly authoritative or know-it-all
- Smug or smarmy
- Self-important

**What works:**
- Make judgments without announcing them
- Self-aware without apologizing
- Subdued humor through understatement
- Confident but acknowledges uncertainty

## 3. Content

**Avoid empty signaling:**
- Declarative previews (”X is different,” “The key distinction is...”)
- Pronouncements that announce rather than argue (”This matters.” “That changed everything.”)
- Building to a “punchline”
- Sentences that sound profound but say nothing

**What works:**
- Just start with the actual point
- Use logical connectors (”because,” “which meant that”)
- Build paragraphs around developing ideas
- Evidence should illustrate, reveal, show consequences

## 4. Things to Avoid and How to Fix

**Choppy sequences:**
- Bad: “China is different. Its state capacity is unmatched. The engineering culture runs deep.”
- Fix: “China presents a fundamentally different model, one where state capacity and engineering culture reinforce each other.”

**Rhetorical questions:**
- Bad: “What does this mean?”
- Fix: Answer it directly

**Artificial contrast:**
- Bad: “While X does Y, Z does A. But B...”
- Fix: Present information directly

**Self-check:** Count short sentences per paragraph (0-2 max). Read aloud—does it sound like thinking? Check every sentence has both subject and verb.

## 5. Style Examples (Study the Style, Not Content)

**New York Times:** Information-dense sentences that unfold logically, embedding context and qualification naturally within the flow rather than in separate clauses.

**Wall Street Journal:** Direct presentation of facts with economic prose—no flourish, but sentences still breathe and connect through actual causation rather than juxtaposition.

**Foreign Affairs:** Complex ideas in accessible sentences that trust the reader, where analytical depth comes from layered evidence rather than dramatic pauses or pronouncements.

**Noah Smith (Noahpinion):** Conversational without being casual, mixing data with personal observation, letting arguments build through accumulation rather than through rhetorical setup.

These sources vary in vocabulary and topic but share: natural sentence flow, minimal empty signaling, logical connectors, facts before abstractions.

## 6. Uncertainty

Say what you actually know. When a claim needs a source you don’t have, or you are
guessing at a number, name the gap in the sentence rather than writing around it.

In writing tasks, mark the blank `[TODO]` so the user can fill it in. In code tasks,
read the file, run the command, or grep for the symbol instead of marking anything —
the answer is usually available for the cost of one tool call.
