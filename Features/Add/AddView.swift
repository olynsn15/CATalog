//
//  AddView.swift
//  CATalog
//
//  Created by Carolyn Santana on 22/07/26.
//

import SwiftUI

struct AddView: View {
    let image: UIImage
    
    @State private var vm = AddVM()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                previewSection
                
                VStack(spacing: 16) {
                    modeSection
                    
                    if vm.mode == .new {
                        newCatSection
                    } else {
                        existingCatSection
                    }
                    
                    notesSection
                }
                
                saveButton
            }
            .padding(24)
        }
        .navigationTitle("New Encounter")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension AddView {
    var previewSection: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(height: 260)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    var modeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("This cat is...")
                .font(.headline)
            
            Picker(
                "Mode",
                selection: $vm.mode
            ) {
                
                ForEach(AddVM.Mode.allCases) { mode in
                    
                    Text(mode.title)
                        .tag(mode)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
    var newCatSection: some View {
        VStack(alignment: .leading, spacing: 30) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Cat Name")
                    .font(.headline)
                
                TextField(
                    "e.g. Mochi",
                    text: $vm.catName
                )
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Coat Color")
                    .font(.headline)
                
                DropdownField(
                    title: vm.coatColor == .unknown ? "" : vm.coatColor.displayName,
                    placeholder: "Select coat color"
                ) {
                    
                    ForEach(CoatColor.allCases) { color in
                        
                        Button(color.displayName) {
                            vm.coatColor = color
                        }
                        
                    }
                    
                }
            }
        }
    }
    
    var existingCatSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Choose Cat")
                .font(.headline)
            
            DropdownField(
                title: vm.selectedExistingCat,
                placeholder: "Select a cat"
            ) {
                
                ForEach(vm.existingCats, id: \.self) { cat in
                    
                    Button(cat) {
                        vm.selectedExistingCat = cat
                    }
                    
                }
                
            }
        }
    }
    
    var notesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Notes")
                .font(.headline)
            
            TextField(
                "Optional...",
                text: $vm.notes,
                axis: .vertical
            )
            .lineLimit(4...6)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    var saveButton: some View {
        Button {
            // TODO:
            // Save Cat / Encounter
        } label: {
            
            Text("Save Encounter")
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(.orange)
                .clipShape(Capsule())
        }
        .disabled(!vm.canSave)
        .opacity(vm.canSave ? 1 : 0.5)
    }
}

#Preview {
    NavigationStack {
        AddView(
            image: UIImage(named: "cat_sample")!
        )
    }
}
