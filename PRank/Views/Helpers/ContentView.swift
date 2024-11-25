//
//  ContentView.swift
//  PRank
//
//  Created by seb's on 11/12/24.
//
import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    private let categoryOrder: [PRank.Category] = [
        .legend,       // Primero las Leyendas
        .topglobal,    // Luego los Top Globales
        .professional,
        .elite,        // Luego los Elite
        .advanced,     // Luego los Avanzados
        .intermediate, // Luego los Intermedios
        .beginner      // Por último los Principiantes
    ]

    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Imagen específica como portada
                        Image("samsulek2") // Aquí asegúrate que "samsulek2" sea el nombre correcto en tus assets
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.horizontal)

                        // Categorías en el orden deseado
                        ForEach(categoryOrder, id: \.self) { category in
                            if let items = ModelData().categories[category.rawValue] {
                                CategoryRow(categoryName: category.rawValue, items: items)
                            }
                        }
                    }
                }
                .navigationTitle("PRank")
            }
            .tag(Tab.featured)
            .tabItem {
                Label("Featured", systemImage: "star")
            }

            PRankList()
                .tag(Tab.list)
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}


/*

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

*/
