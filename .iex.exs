IO.puts("Welcome to Zendesk Search\n")

import DataSearcher.DataLoader
import DataSearcher.Indexer

load_organizations()
load_users()
load_tickets()

create_index()

Console.run()
