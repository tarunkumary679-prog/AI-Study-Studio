# AI Study Studio 

> A SwiftUI-based educational iOS application designed to make learning easier through structured notes, visual explanations, diagrams, flowcharts, and quick revision.

---

## 👨‍🎓 Student

**Name:** Tarun Kumar Yadav  
**Course:** B.Tech — 2nd Year  
**Project Type:** iOS Lab / Academic Project  
**Instructor:** Anjali Srivastava  

---

## 📌 Project Overview

**AI Study Studio** is an educational iOS application prototype built using **SwiftUI**. The project is designed around a simple idea: a student should be able to enter any academic topic and choose the type of learning material they need.

The application provides six dedicated learning modes:

1. **Handwritten** — structured, handwritten-style study notes.
2. **Visualize** — visual, step-by-step learning representation.
3. **Sticky Notes** — short and important points for quick learning.
4. **Diagram** — simple topic-based diagram representation.
5. **Flowchart** — process-oriented step-by-step flowchart.
6. **Revision** — compact revision material containing important concepts and key points.

For example, when the topic **Photosynthesis** is selected, the application can organize information such as its definition, raw materials, chemical equation, important elements, process, and importance.

The current version is implemented as a **single-file SwiftUI project (`ContentView.swift`)** and uses a local content-generation engine for demonstration. It is structured so that a real AI backend can be integrated in a future version.

---

## Objectives

The main objectives of this project are:

- To create a simple and student-friendly iOS learning application.
- To organize academic information into different learning formats.
- To make difficult concepts easier to understand through visual representations.
- To provide quick revision material before tests and examinations.
- To demonstrate modern iOS UI development using SwiftUI.
- To design an application architecture that can later be connected to an AI service.
- To provide a practical implementation as part of the B.Tech 2nd-year iOS lab project.

---

## Key Features

### 1. `/handwritten`

Generates detailed study notes in a handwritten-notes inspired structure.

**Includes:**
- Topic definition
- Important concepts
- Raw materials or required components
- Equations or formulas where applicable
- Main elements
- Process explanation
- Importance and applications

**Example:**

```text
/handwritten: Photosynthesis
```

---

### 2. `/visualize`

Provides a visual learning sequence for the selected topic.

Instead of presenting only paragraphs, the concept is divided into connected stages so that students can understand the topic progressively.

**Example:**

```text
/visualize: Photosynthesis
```

Possible learning sequence:

```text
Sunlight
   ↓
Chlorophyll
   ↓
Water + Carbon Dioxide
   ↓
Glucose Formation
   ↓
Oxygen Release
```

---

### 3. `/stickynotes`

Creates short, focused learning notes containing the most important information.

**Useful for:**
- Last-minute revision
- Important facts
- Definitions
- Quick recall
- Exam preparation

**Example:**

```text
/stickynotes: Photosynthesis
```

---

### 4. `/diagram`

Creates a simple conceptual diagram based on the selected topic.

The purpose is to help students understand the relationship between different components of a topic instead of memorizing isolated information.

**Example:**

```text
/diagram: Photosynthesis
```

---

### 5. `/flowchart`

Represents a process in a step-by-step format.

This is especially useful for topics involving:
- Scientific processes
- Algorithms
- Procedures
- Biological cycles
- System workflows

**Example:**

```text
/flowchart: Photosynthesis
```

---

### 6. `/revision`

Produces a compact revision-oriented summary of the selected topic.

**Includes:**
- Core concept
- Important points
- Key terms
- Main process
- Important facts
- Self-test/review prompts

**Example:**

```text
/revision: Photosynthesis
```

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| **Swift** | Primary programming language |
| **SwiftUI** | User interface development |
| **Xcode** | iOS development environment |
| **iOS 17+** | Target platform |
| **SF Symbols** | Icons and interface elements |
| **Local Swift Logic** | Demo content generation |

---

## Project Architecture

The current project intentionally keeps the implementation simple and suitable for an academic lab project.

### Main Components

```text
ContentView.swift
│
├── StudyCommand
│   └── Defines the six learning modes
│
├── StudySection
│   └── Represents a section of generated study material
│
├── StudyResult
│   └── Stores the generated result
│
├── StudyEngine
│   └── Generates topic-based demo content
│
└── ContentView
    ├── Learning mode selector
    ├── Topic input field
    ├── Generate button
    └── Result display
```

---

## User Flow

```text
Launch Application
        ↓
Choose Learning Mode
        ↓
Enter Topic Name
        ↓
Generate Content
        ↓
Study the Result
        ↓
Copy Notes / Review
```

---

## How to Run

### Requirements

- macOS
- Xcode
- iOS 17 or later
- Basic Swift/SwiftUI development environment

### Steps

1. Open **Xcode**.
2. Create a new **iOS App** project using **SwiftUI**.
3. Set the deployment target to **iOS 17 or later**.
4. Open `ContentView.swift`.
5. Replace the default `ContentView.swift` code with the project code.
6. Select an iPhone Simulator or connected iPhone.
7. Press **Run ▶**.

---

##  Example Usage

### Topic: Photosynthesis

Select:

```text
Handwritten
```

Enter:

```text
Photosynthesis
```

The application can organize the topic into sections such as:

```text
Definition
Raw Materials
Chemical Equation
Main Elements
Where It Happens
Importance
```

For:

```text
/flowchart: Photosynthesis
```

the process can be represented as:

```text
Start
  ↓
Light is absorbed
  ↓
Water + CO₂ enter the process
  ↓
Glucose is formed
  ↓
Oxygen is released
  ↓
End
```

---

## UI Design

The application uses a simple, student-focused interface.

### Design principles

- Clear learning-mode cards
- Simple topic input
- Large and readable typography
- Color-coded learning modes
- Rounded cards for better visual grouping
- SF Symbols for recognizable icons
- Scrollable learning content
- Copy-to-clipboard support

The interface is designed to keep the focus on **learning rather than unnecessary navigation**.

---

##  Academic Demonstration

This project demonstrates several important concepts of iOS development:

- Swift programming fundamentals
- SwiftUI declarative UI
- `NavigationStack`
- `ScrollView`
- `LazyVGrid`
- `@State` property wrappers
- Enumerations with computed properties
- Reusable SwiftUI components
- Dynamic content rendering
- User interaction and buttons
- Text input handling
- Clipboard integration using `UIPasteboard`

---

## Current Limitations

The current version is an **academic prototype** and intentionally uses a local Swift-based content engine.

Therefore:

- It does **not yet connect to a live AI model**.
- Generated content is based on predefined/demo logic.
- Diagram and flowchart generation is currently represented through SwiftUI UI elements rather than dynamically generated AI images.
- Topic coverage is limited compared with a production AI system.
- There is no user authentication or cloud database.
- There is no persistent study-history system.

These limitations are intentional opportunities for future development.

---

##  Future Scope

The application can be extended into a full AI-powered learning platform.

### Planned/possible improvements

**AI Integration**
- Connect the app to an LLM through a secure backend.
- Generate content dynamically for arbitrary academic topics.
- Generate customized explanations based on student level.

**AI Image & Diagram Generation**
- Generate actual topic-specific diagrams.
- Generate labelled scientific diagrams.
- Create visual concept maps.
- Generate process illustrations.

**Personalized Learning**
- Class/grade selection
- Subject selection
- Difficulty level
- Personalized explanations
- Adaptive revision

**Study Tools**
- Flashcards
- MCQ generator
- Quiz mode
- Practice questions
- Formula sheets
- Bookmarks
- Study history

**Cloud Features**
- User accounts
- Sync across devices
- Saved notes
- Progress tracking
- Cloud-based study library

---

##  AI Integration Note

For a production version, an AI API key should **not** be embedded directly inside the iOS application.

A safer architecture would be:

```text
iOS App
   ↓
Secure Backend
   ↓
AI API
   ↓
Generated Learning Content
   ↓
iOS App
```

This keeps sensitive API credentials outside the client application.

---

## Suggested Repository Structure

A future multi-file version could use:

```text
AIStudyStudio/
│
├── AIStudyStudioApp.swift
├── ContentView.swift
│
├── Models/
│   ├── StudyCommand.swift
│   ├── StudyResult.swift
│   └── StudySection.swift
│
├── Views/
│   ├── CommandPickerView.swift
│   ├── TopicInputView.swift
│   ├── StudyResultView.swift
│   └── FlowchartView.swift
│
├── Services/
│   └── StudyEngine.swift
│
└── Assets.xcassets
```

The current academic version keeps these concepts together in a single `ContentView.swift` file for simplicity.

---

## Testing

Basic testing can be performed using topics such as:

```text
Photosynthesis
Gravity
Human Digestive System
Cell Structure
Newton's Laws
Water Cycle
Binary Search
Operating System
Database
Computer Networks
```

For each topic, different learning modes can be selected to verify the UI and result-generation flow.

---

##  Learning Outcomes

Through this project, the following skills are demonstrated:

- Understanding of Swift and SwiftUI.
- Building interactive iOS interfaces.
- Managing UI state with SwiftUI.
- Structuring reusable application logic.
- Creating dynamic learning-oriented UI components.
- Understanding how AI-powered features can be integrated into mobile applications.
- Designing an application around a real student problem.

---

## Project Guidance

**Developed by:**  
**Tarun Kumar Yadav**

**Under the guidance of:**  
**Anjali Srivastava**  
iOS Lab Instructor

**Academic Level:**  
B.Tech — 2nd Year

---

## Project Status

**Status:** Academic Prototype / iOS Lab Project

The current release focuses on the core learning experience, UI design, and the structure required for future AI integration.

---

## Acknowledgement

I would like to express my sincere gratitude to **Anjali Srivastava**, my iOS Lab Instructor, for her guidance and support during the development of this project.

This project provided an opportunity to apply SwiftUI and iOS development concepts to a practical educational use case.

---

## Conclusion

**AI Study Studio** is a student-focused iOS learning assistant concept that brings multiple learning formats into one application.

Instead of presenting the same information in only one form, the application allows students to choose how they want to learn:

```text
Notes → Visuals → Sticky Notes → Diagrams → Flowcharts → Revision
```

The project establishes a foundation for a future AI-powered educational application with personalized learning, dynamic diagrams, quizzes, flashcards, and intelligent revision features.

---

##  License

This project was created as an academic B.Tech 2nd-year iOS Lab project.

You may adapt the code for educational and learning purposes. For public redistribution or commercial use, please review and add an appropriate open-source license.
