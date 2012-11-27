collection @stores, root: "stores"

attributes :id, :name

node(:image) {|store| store.picture}
