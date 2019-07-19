IO.puts("Welcome to Zendesk Search\n")

import DataSearcher.DataLoader
import DataSearcher.Indexer

load_orgnizations()
load_users()
load_tickets()

create_index()

Console.run()
