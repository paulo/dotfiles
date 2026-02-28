# General Behavior

- When asked to fetch a URL, do it immediately without asking for confirmation.

# Claude Code Guidelines

## Implementation Best Practices

### 0 — Purpose

These rules ensure maintainability, safety, and developer velocity. **MUST**
rules are enforced by CI; **SHOULD** rules are strongly recommended.

---

### 1 — Before Coding

- **BP-1 (MUST)** Ask the user clarifying questions.
- **BP-2 (SHOULD)** Draft and confirm an approach for complex work.
- **BP-3 (SHOULD)** If ≥ 2 approaches exist, list clear pros and cons.

---

### 2 — While Coding

- **C-1 (MUST)** Follow TDD: scaffold stub -> write failing test -> implement.
- **C-2 (MUST)** Name functions with existing domain vocabulary for consistency.
- **C-3 (SHOULD NOT)** Over-engineer with complex interfaces when simple functions suffice.
- **C-4 (SHOULD)** Prefer simple, composable, testable functions.
- **C-5 (MUST)** Use custom types for domain-specific values
  ```go
  type UserID string // ✅ Good
  // string           // ❌ Bad for user IDs
  ```
- **C-6 (MUST)** Follow Go naming conventions: exported functions/types start with uppercase, unexported with lowercase.
- **C-7 (SHOULD NOT)** Add comments except for critical caveats and public API documentation; rely on self‑explanatory code.
- **C-8 (MUST)** Handle errors explicitly; never ignore them with `_`.
- **C-9 (SHOULD NOT)** Extract a new function unless it will be reused
  elsewhere, is the only way to unit-test otherwise untestable logic, or
  drastically improves readability of an opaque block.

---

### 3 — Testing

- **T-1 (MUST)** For a simple function, colocate unit tests in `*_test.go` in
  same package as source file.
- **T-2 (MUST)** For any API change, add/extend integration tests in
  appropriate test directories.
- **T-3 (MUST)** ALWAYS separate pure-logic unit tests from database/external service integration tests.
- **T-4 (SHOULD)** Prefer integration tests over heavy mocking.
- **T-5 (SHOULD)** Unit-test complex algorithms thoroughly.
- **T-6 (SHOULD)** Use table-driven tests for multiple test cases
  ```go
  tests := []struct {
    name     string
    input    string
    expected int
  }{
    {"empty string", "", 0},
    {"single char", "a", 1},
  }
  for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
      result := getCharacterCount(tt.input)
      assert.Equal(t, tt.expected, result)
    })
  }
  ```

---

### 4 — Database

- **D-1 (MUST)** Use interfaces for database abstraction to enable testing and different implementations.
  ```go
  type UserRepository interface {
    Create(ctx context.Context, user User) error
    GetByID(ctx context.Context, id UserID) (*User, error)
  }
  ```
- **D-2 (SHOULD)** Use `sql.NullString`, `sql.NullInt64` etc. for nullable database fields.
- **D-3 (MUST)** Always pass `context.Context` as first parameter for database operations.

---

### 5 — Code Organization

- **O-1 (MUST)** Place shared code in internal packages or separate modules only if used by ≥ 2 packages.
- **O-2 (SHOULD)** Follow Go project layout: https://github.com/golang-standards/project-layout
- **O-3 (MUST)** Keep `main.go` minimal - move business logic to separate packages.

---

### 6 — Tooling Gates

- **G-1 (MUST)** `go fmt` and `goimports` formatting passes.
- **G-2 (MUST)** `go vet` and `golangci-lint` checks pass.
- **G-3 (MUST)** `go mod tidy` keeps dependencies clean.

---

### 7 - Git

- **GH-1 (MUST**) Use Conventional Commits format when writing commit messages:
  https://www.conventionalcommits.org/en/v1.0.0
- **GH-2 (SHOULD NOT**) Refer to Claude or Anthropic in commit messages.

---

## Writing Functions Best Practices

When evaluating whether a function you implemented is good or not, use this
checklist:

1. Can you read the function and HONESTLY easily follow what it's doing? If yes,
   then stop here.
2. Does the function have very high cyclomatic complexity? (number of
   independent paths, or, in a lot of cases, number of nesting if if-else as a
   proxy). If it does, then it's probably sketchy.
3. Are there any common data structures and algorithms that would make this
   function much easier to follow and more robust? Parsers, trees, stacks /
   queues, etc.
4. Are there any unused parameters in the function?
5. Are there any unnecessary type conversions that can be avoided with better type design?
6. Does the function handle errors properly and return them to the caller?
7. Is the function easily testable without mocking core features (e.g. database queries, external APIs)? If not, can this function be tested as part of an integration test?
8. Does it have any hidden untested dependencies or any values that can be factored out into the arguments instead? Only care about non-trivial dependencies that can actually change or affect the function.
9. Brainstorm 3 better function names and see if the current name is the best, consistent with rest of codebase.

IMPORTANT: you SHOULD NOT refactor out a separate function unless there is a
compelling need, such as:

- the refactored function is used in more than one place
- the refactored function is easily unit testable while the original function is
  not AND you can't test it any other way
- the original function is extremely hard to follow and you resort to putting
  comments everywhere just to explain it

## Writing Tests Best Practices

When evaluating whether a test you've implemented is good or not, use this
checklist:

1. SHOULD parameterize inputs; never embed unexplained literals such as 42 or
   "foo" directly in the test.
2. SHOULD NOT add a test unless it can fail for a real defect. Trivial asserts
   (e.g., assert.Equal(t, 2, 2)) are forbidden.
3. SHOULD ensure the test name states exactly what the final assertion
   verifies. If the wording and assertion don't align, rename or rewrite.
4. SHOULD compare results to independent, pre-computed expectations or to
   properties of the domain, never to the function's output re-used as the
   oracle.
5. SHOULD follow the same formatting and style rules as prod code
   (go fmt, goimports, golangci-lint).
6. SHOULD express invariants or axioms (e.g., commutativity, idempotence,
   round-trip) rather than single hard-coded cases whenever practical. Use
   property-based testing libraries like `gopter` e.g.

```go
func TestStringConcatenationProperty(t *testing.T) {
    parameters := gopter.DefaultTestParameters()
    properties := gopter.NewProperties(parameters)
    
    properties.Property("concatenation length", prop.ForAll(
        func(a, b string) bool {
            return getCharacterCount(a+b) == getCharacterCount(a)+getCharacterCount(b)
        },
        gen.AnyString(),
        gen.AnyString(),
    ))
    
    properties.TestingRun(t)
}
```

7. Use table-driven tests with `t.Run()` for multiple test cases of the same function.
8. Use `testify/assert` or `testify/require` for better assertion messages.
9. ALWAYS use strong assertions over weaker ones e.g. `assert.Equal(t, 1, x)`
   instead of `assert.GreaterOrEqual(t, x, 1)`.
10. SHOULD test edge cases, realistic input, unexpected input, and value
    boundaries.
11. SHOULD test error conditions and ensure proper error types are returned.

## Code Organization

Follow Go project layout conventions:
- `cmd/` - Main applications for this project
- `internal/` - Private application and library code
- `pkg/` - Library code that's ok to use by external applications
- `api/` - OpenAPI/Swagger specs, JSON schema files, protocol definition files
- `configs/` - Configuration file templates or default configs
- `test/` - Additional external test apps and test data

## Remember Shortcuts

Remember the following shortcuts which the user may invoke at any time.

### QNEW

When I type "qnew", this means:

```
Understand all BEST PRACTICES listed in CLAUDE.md.
Your code SHOULD ALWAYS follow these best practices.
```

### QPLAN

When I type "qplan", this means:

```
Analyze similar parts of the codebase and determine whether your plan:
- is consistent with rest of codebase
- introduces minimal changes
- reuses existing code
```

## QCODE

When I type "qcode", this means:

```
Implement your plan and make sure your new tests pass.
Always run tests to make sure you didn't break anything else.
Always run `go fmt` and `goimports` on newly created files to ensure standard formatting.
Always run `go vet` and `golangci-lint` to make sure linting passes.
Always run `go mod tidy` to clean up dependencies.
```

### QCHECK

When I type "qcheck", this means:

```
You are a SKEPTICAL senior software engineer.
Perform this analysis for every MAJOR code change you introduced (skip minor changes):

1. CLAUDE.md checklist Writing Functions Best Practices.
2. CLAUDE.md checklist Writing Tests Best Practices.
3. CLAUDE.md checklist Implementation Best Practices.
```

### QCHECKF

When I type "qcheckf", this means:

```
You are a SKEPTICAL senior software engineer.
Perform this analysis for every MAJOR function you added or edited (skip minor changes):

1. CLAUDE.md checklist Writing Functions Best Practices.
```

### QCHECKT

When I type "qcheckt", this means:

```
You are a SKEPTICAL senior software engineer.
Perform this analysis for every MAJOR test you added or edited (skip minor changes):

1. CLAUDE.md checklist Writing Tests Best Practices.
```

### QUX

When I type "qux", this means:

```
Imagine you are a human UX tester of the feature you implemented.
Output a comprehensive list of scenarios you would test, sorted by highest priority.
```

### QGIT

When I type "qgit", this means:

```
Add all changes to staging, create a commit, and push to remote.

Follow this checklist for writing your commit message:
- SHOULD use Conventional Commits format: https://www.conventionalcommits.org/en/v1.0.0
- SHOULD NOT refer to Claude or Anthropic in the commit message.
- SHOULD structure commit message as follows:
<type>[optional scope]: <description>
[optional body]
[optional footer(s)]
- commit SHOULD contain the following structural elements to communicate intent:
fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH in Semantic Versioning).
feat: a commit of the type feat introduces a new feature to the codebase (this correlates with MINOR in Semantic Versioning).
BREAKING CHANGE: a commit that has a footer BREAKING CHANGE:, or appends a ! after the type/scope, introduces a breaking API change (correlating with MAJOR in Semantic Versioning). A BREAKING CHANGE can be part of commits of any type.
types other than fix: and feat: are allowed, for example @commitlint/config-conventional (based on the Angular convention) recommends build:, chore:, ci:, docs:, style:, refactor:, perf:, test:, and others.
footers other than BREAKING CHANGE: <description> may be provided and follow a convention similar to git trailer format.
```