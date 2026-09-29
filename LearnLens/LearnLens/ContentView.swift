/Users/student/Desktop/LearnLens/LearnLens/ContentView.swift
import SwiftUI

// MARK: - Commands

enum StudyCommand: String, CaseIterable, Identifiable {
    case handwritten = "Handwritten"
    case visualize = "Visualize"
    case stickyNotes = "Sticky Notes"
    case diagram = "Diagram"
    case flowchart = "Flowchart"
    case revision = "Revision"

    var id: String { rawValue }

    var slash: String {
        switch self {
        case .handwritten: return "/handwritten"
        case .visualize: return "/visualize"
        case .stickyNotes: return "/stickynotes"
        case .diagram: return "/diagram"
        case .flowchart: return "/flowchart"
        case .revision: return "/revision"
        }
    }

    var symbol: String {
        switch self {
        case .handwritten: return "pencil.and.outline"
        case .visualize: return "brain.head.profile"
        case .stickyNotes: return "note.text"
        case .diagram: return "point.3.connected.trianglepath.dotted"
        case .flowchart: return "arrow.triangle.branch"
        case .revision: return "graduationcap"
        }
    }

    var color: Color {
        switch self {
        case .handwritten: return .green
        case .visualize: return .purple
        case .stickyNotes: return .orange
        case .diagram: return .blue
        case .flowchart: return .pink
        case .revision: return .teal
        }
    }

    var description: String {
        switch self {
        case .handwritten: return "Detailed handwritten-style study notes"
        case .visualize: return "Visual learning and explanation"
        case .stickyNotes: return "Short notes and important facts"
        case .diagram: return "Topic-based labelled diagram"
        case .flowchart: return "Step-by-step process flowchart"
        case .revision: return "Complete revision and key points"
        }
    }
}

// MARK: - Content Model

struct StudySection: Identifiable {
    let id = UUID()
    let title: String
    let body: String
}

struct StudyResult {
    let heading: String
    let sections: [StudySection]
    let steps: [String]
    let isVisual: Bool
}

// MARK: - Local Study Content Engine

struct StudyEngine {

    static func generate(
        command: StudyCommand,
        topic: String
    ) -> StudyResult {

        let name = topic.trimmingCharacters(in: .whitespacesAndNewlines)
        let topicName = name.isEmpty ? "Your Topic" : name
        let isPhoto = topicName.localizedCaseInsensitiveContains(
            "photosynthesis"
        )

        switch command {

        case .handwritten:
            if isPhoto {
                return StudyResult(
                    heading: "Handwritten Notes: Photosynthesis",
                    sections: [
                        .init(
                            title: "1. Definition",
                            body: "Photosynthesis is the process by which green plants use sunlight, carbon dioxide and water to prepare glucose and release oxygen."
                        ),
                        .init(
                            title: "2. Raw Materials",
                            body: "• Carbon dioxide (CO₂), absorbed from the air.\n• Water (H₂O), absorbed by the roots.\n• Sunlight, captured by chlorophyll."
                        ),
                        .init(
                            title: "3. Chemical Equation",
                            body: "6CO₂ + 6H₂O  →  C₆H₁₂O₆ + 6O₂\n\nLight energy and chlorophyll are required."
                        ),
                        .init(
                            title: "4. Main Elements",
                            body: "Carbon, hydrogen and oxygen are present in glucose. Magnesium is an important part of the chlorophyll molecule."
                        ),
                        .init(
                            title: "5. Where It Happens",
                            body: "Photosynthesis takes place mainly in the chloroplasts of green plant cells."
                        ),
                        .init(
                            title: "6. Importance",
                            body: "• Produces food for plants.\n• Releases oxygen.\n• Supports food chains.\n• Helps maintain the balance of carbon dioxide and oxygen."
                        )
                    ],
                    steps: [
                        "Sunlight is absorbed by chlorophyll",
                        "Roots absorb water",
                        "Leaves take in carbon dioxide",
                        "Light energy helps produce glucose",
                        "Oxygen is released"
                    ],
                    isVisual: false
                )
            }

            return generic(
                topicName,
                title: "Handwritten Study Notes",
                sections: [
                    ("Introduction", "Learn the meaning and basic idea of \(topicName)."),
                    ("Key concepts", "Identify the main concepts, terminology and important facts related to \(topicName)."),
                    ("How it works", "Understand the main principles and how they are connected."),
                    ("Examples", "Write down examples of \(topicName) from textbooks and everyday life."),
                    ("Importance", "Understand why \(topicName) is studied and where it is useful.")
                ]
            )

        case .visualize:
            return generic(
                topicName,
                title: "Visual Learning: \(topicName)",
                sections: [
                    ("Concept", "Start with the main idea of \(topicName)."),
                    ("Understand", "Break the topic into smaller parts and connect each part."),
                    ("Remember", "Use the visual steps below to follow the concept.")
                ],
                steps: isPhoto
                    ? [
                        "Sunlight",
                        "Water + Carbon dioxide",
                        "Chlorophyll captures light",
                        "Glucose is produced",
                        "Oxygen is released"
                    ]
                    : [
                        "Introduction to \(topicName)",
                        "Identify its main components",
                        "Understand how they connect",
                        "Study a practical example",
                        "Review the main idea"
                    ],
                visual: true
            )

        case .stickyNotes:
            return generic(
                topicName,
                title: "Sticky Notes: \(topicName)",
                sections: [
                    ("IMPORTANT", isPhoto
                        ? "Photosynthesis converts light energy into chemical energy."
                        : "Remember the definition and central idea of \(topicName)."),
                    ("KEY FACT", isPhoto
                        ? "Chlorophyll absorbs light energy."
                        : "Identify the most important fact about \(topicName)."),
                    ("REMEMBER", isPhoto
                        ? "Carbon dioxide and water are raw materials."
                        : "Learn the key terms, concepts and examples."),
                    ("QUICK TIP", "Explain the topic in your own words to check your understanding.")
                ]
            )

        case .diagram:
            return generic(
                topicName,
                title: "Diagram: \(topicName)",
                sections: [
                    ("Diagram guide", "The following is a simple conceptual diagram. Use the labels to understand the relationships.")
                ],
                steps: isPhoto
                    ? [
                        "Sunlight",
                        "Leaf / Chlorophyll",
                        "Water from roots",
                        "Carbon dioxide from air",
                        "Glucose + Oxygen"
                    ]
                    : [
                        "\(topicName)",
                        "Main component A",
                        "Main component B",
                        "Main outcome"
                    ],
                visual: true
            )

        case .flowchart:
            return generic(
                topicName,
                title: "Flowchart: \(topicName)",
                sections: [
                    ("Process", "Follow the steps in order to understand the process.")
                ],
                steps: isPhoto
                    ? [
                        "Start",
                        "Light is absorbed",
                        "Water and CO₂ enter the process",
                        "Glucose is formed",
                        "Oxygen is released",
                        "End"
                    ]
                    : [
                        "Start",
                        "Understand \(topicName)",
                        "Identify the main steps",
                        "Connect the steps",
                        "Check the final result",
                        "End"
                    ],
                visual: true
            )

        case .revision:
            return generic(
                topicName,
                title: "Revision: \(topicName)",
                sections: [
                    ("1. Core concept", isPhoto
                        ? "Photosynthesis is the process of making glucose using light energy."
                        : "Revise the definition and main concept of \(topicName)."),
                    ("2. Key points", isPhoto
                        ? "Light, chlorophyll, carbon dioxide and water are important."
                        : "Remember the main components, principles and important facts."),
                    ("3. What to remember", isPhoto
                        ? "The process produces glucose and releases oxygen."
                        : "Revise the main terminology, examples and applications."),
                    ("4. Self-test", "Can you explain \(topicName) without looking at your notes?")
                ],
                steps: isPhoto
                    ? [
                        "Definition",
                        "Raw materials",
                        "Chemical equation",
                        "Process",
                        "Importance"
                    ]
                    : [
                        "Definition",
                        "Key concepts",
                        "Main process",
                        "Examples",
                        "Importance"
                    ]
            )
        }
    }

    private static func generic(
        _ topic: String,
        title: String,
        sections: [(String, String)],
        steps: [String] = [],
        visual: Bool = false
    ) -> StudyResult {
        StudyResult(
            heading: title,
            sections: sections.map {
                StudySection(title: $0.0, body: $0.1)
            },
            steps: steps,
            isVisual: visual
        )
    }
}

// MARK: - Main Screen

struct ContentView: View {

    @State private var selected: StudyCommand = .handwritten
    @State private var topic: String = ""
    @State private var result: StudyResult?
    @State private var isShowingResult = false

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {

                    header

                    commandPicker

                    topicInput

                    generateButton

                    if let result = result {
                        resultView(result)
                    }

                    footer
                }
                .padding()
            }
            .background(Color(uiColor: .systemGroupedBackground))
            .navigationTitle("Study AI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "sparkles")
                    .font(.largeTitle)
                    .foregroundStyle(.purple)

                Text("AI Study Studio")
                    .font(.largeTitle.bold())
            }

            Text("Learn any topic with notes, diagrams and revision.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
    }

    // MARK: Command Picker

    private var commandPicker: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Choose a learning mode")
                .font(.headline)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(StudyCommand.allCases) { command in
                    Button {
                        selected = command
                        result = nil
                    } label: {
                        VStack(alignment: .leading, spacing: 10) {
                            Image(systemName: command.symbol)
                                .font(.title2)
                                .foregroundStyle(command.color)

                            Text(command.rawValue)
                                .font(.headline)
                                .foregroundStyle(.primary)

                            Text(command.description)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.leading)

                            Spacer(minLength: 0)

                            if selected == command {
                                Label("Selected", systemImage: "checkmark.circle.fill")
                                    .font(.caption.bold())
                                    .foregroundStyle(command.color)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 120)
                        .padding(12)
                        .background(
                            selected == command
                            ? command.color.opacity(0.12)
                            : Color(uiColor: .secondarySystemGroupedBackground)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(
                                    selected == command
                                    ? command.color
                                    : Color.gray.opacity(0.15),
                                    lineWidth: selected == command ? 2 : 1
                                )
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    // MARK: Topic Input

    private var topicInput: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Enter your topic")
                .font(.headline)

            TextField("e.g. Photosynthesis, Gravity, Cells", text: $topic)
                .textFieldStyle(.roundedBorder)
                .font(.body)
                .submitLabel(.go)
                .onSubmit(generate)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.words)

            Text("Command: \(selected.slash): \(topic.isEmpty ? "topic name" : topic)")
                .font(.caption.monospaced())
                .foregroundStyle(.secondary)
        }
    }

    // MARK: Generate Button

    private var generateButton: some View {
        Button(action: generate) {
            HStack {
                Image(systemName: "sparkles")
                Text("Generate \(selected.rawValue)")
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(selected.color)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
        .disabled(topic.trimmingCharacters(in: .whitespaces).isEmpty)
        .opacity(topic.trimmingCharacters(in: .whitespaces).isEmpty ? 0.5 : 1)
    }

    private func generate() {
        let cleanTopic = topic.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard !cleanTopic.isEmpty else { return }

        result = StudyEngine.generate(
            command: selected,
            topic: cleanTopic
        )
    }

    // MARK: Results

    @ViewBuilder
    private func resultView(_ result: StudyResult) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider()

            HStack {
                Text(result.heading)
                    .font(.title2.bold())

                Spacer()

                Button {
                    let text = result.sections.map {
                        "\($0.title)\n\($0.body)"
                    }.joined(separator: "\n\n")

                    UIPasteboard.general.string =
                        "\(result.heading)\n\n\(text)"
                } label: {
                    Image(systemName: "doc.on.doc")
                        .font(.title3)
                }
                .accessibilityLabel("Copy notes")
            }

            ForEach(result.sections) { section in
                VStack(alignment: .leading, spacing: 8) {
                    Text(section.title)
                        .font(.headline)
                        .foregroundStyle(selected.color)

                    Text(section.body)
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(
                    Color(uiColor: .secondarySystemGroupedBackground)
                )
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            if !result.steps.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Visual representation")
                        .font(.headline)

                    ForEach(
                        Array(result.steps.enumerated()),
                        id: \.offset
                    ) { index, step in
                        VStack(spacing: 6) {
                            Text(step)
                                .font(.subheadline.bold())
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(
                                    selected.color.opacity(0.12)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(
                                            selected.color.opacity(0.5),
                                            lineWidth: 1
                                        )
                                }

                            if index < result.steps.count - 1 {
                                Image(systemName: "arrow.down")
                                    .font(.title3.bold())
                                    .foregroundStyle(selected.color)
                            }
                        }
                    }
                }
                .padding(.top, 8)
            }

            Text("Demo content — verify subject-specific facts with your textbook.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.top, 8)
    }

    private var footer: some View {
        Text("Study AI • Single-file SwiftUI demo")
            .font(.caption)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity)
            .padding(.top, 8)
    }
}

#Preview {
    ContentView()
}
