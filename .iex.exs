IO.puts("Welcome to Zendesk Search\n")

import DataSearcher.DataLoader
import DataSearcher.Repo

load_orgnizations()
load_users()
load_tickets()

create_index()

Console.run()
