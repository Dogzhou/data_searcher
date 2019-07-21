defmodule RepoTest do
  use ExUnit.Case
  alias DataSearcher.{DataLoader, Repo, Indexer}

  setup_all do
    DataLoader.load_organizations()
    DataLoader.load_users()
    DataLoader.load_tickets()
    Indexer.create_index()

    :ok
  end

  describe ".all" do
    test "users" do
      assert Repo.all(:user) |> length() == 75
    end

    test "tickets" do
      assert Repo.all(:ticket) |> length() == 200
    end

    test "organization" do
      assert Repo.all(:organization) |> length() == 25
    end
  end

  describe ".search" do
    test "users by _id" do
      {:user, search_result} = Repo.search({:user, "_id", 33})
      user = search_result |> hd()

      assert search_result |> length() == 1
      assert user["_id"] == 33
      assert user["name"] == "Jaime Dickerson"
      assert user["tags"] == ["Hachita", "Hasty", "Campo", "Sugartown"]
      assert user["assigned_tickets"] |> length() == 4
      assert user["assigned_tickets"] |> hd() |> Map.get("subject") == "A Problem in Zaire"
      assert user["submitted_tickets"] |> length() == 3
      assert user["submitted_tickets"] |> hd() |> Map.get("_id") == "2614576f-98fb-4031-9e13-beca7a6a73ee"
      assert user["organization"] |> hd() |> Map.get("name") == "Nutralab"
    end

    test "users by timestamp field(created_at)" do
      {:user, search_result} = Repo.search({:user, "created_at", "2016-04-30"})

      assert search_result |> length() == 1
    end

    test "users by boolean field(active)" do
      {:user, search_result} = Repo.search({:user, "active", "true"})
      first_user = search_result |> List.first()
      last_user = search_result |> List.last()

      assert search_result |> length() == 39
      assert first_user["name"] == "Francisca Rasmussen"
      assert last_user["name"] == "Prince Hinton"
    end

    test "users by string field(role)" do
      {:user, search_result} = Repo.search({:user, "role", "admin"})
      first_user = search_result |> List.first()
      last_user = search_result |> List.last()

      assert search_result |> length() == 24
      assert first_user["name"] == "Francisca Rasmussen"
      assert last_user["name"] == "Melissa Bishop"
    end

    test "organization by _id" do
      {:organization, search_result} = Repo.search({:organization, "_id", 113})
      organization = search_result |> hd()

      assert search_result |> length() == 1
      assert organization["_id"] == 113
      assert organization["name"] == "Noralex"
      assert organization["domain_names"] == ["artiq.com", "mazuda.com", "surelogic.com", "fuelworks.com"]
      assert organization["users"] |> length() == 4
      assert organization["users"] |> hd() |> Map.get("name") == "Tyler Bates"
      assert organization["tickets"] |> length() == 7
      assert organization["tickets"] |> hd() |> Map.get("subject") == "A Problem in Tonga"
    end

    test "organizations by timestamp field(created_at)" do
      {:organization, search_result} = Repo.search({:organization, "created_at", "2016-05-28"})

      assert search_result |> hd() |> Map.get("name") == "Plasmos"
      assert search_result |> length() == 1
    end

    test "organizations by array field(tags)" do
      {:organization, search_result} = Repo.search({:organization, "tags", "Cherry"})

      assert search_result |> hd() |> Map.get("name") == "Nutralab"
      assert search_result |> length() == 1
    end

    test "organizations by boolean field(active)" do
      {:organization, search_result} = Repo.search({:organization, "shared_tickets", "true"})
      first_org = search_result |> List.first()
      last_org = search_result |> List.last()

      assert search_result |> length() == 10
      assert first_org["name"] == "Sulfax"
      assert last_org["name"] == "Bitrex"
    end

    test "organizations by string field(role)" do
      {:organization, search_result} = Repo.search({:organization, "details", "Non profit"})
      first_org = search_result |> List.first()
      last_org = search_result |> List.last()

      assert search_result |> length() == 7
      assert first_org["name"] == "Nutralab"
      assert last_org["name"] == "Bitrex"
    end

    test "tickets by _id" do
      {:ticket, search_result} = Repo.search({:ticket, "_id", "c73a0be5-e967-4948-b0a4-eff98d1a43ad"})
      ticket = search_result |> hd()

      assert search_result |> length() == 1
      assert ticket["_id"] == "c73a0be5-e967-4948-b0a4-eff98d1a43ad"
      assert ticket["subject"] == "A Catastrophe in Maldives"
      assert ticket["tags"] == ["Virginia", "Virgin Islands", "Maine", "West Virginia"]
      assert ticket["submitter"] |> length() == 1
      assert ticket["submitter"] |> hd() |> Map.get("name") == "Craig Nash"
      assert ticket["assignee"] |> length() == 1
      assert ticket["assignee"] |> hd() |> Map.get("name") == "Gallegos Armstrong"
      assert ticket["organization"] |> hd() |> Map.get("name") == "Geekfarm"
    end

    test "tickets by timestamp field(created_at)" do
      {:ticket, search_result} = Repo.search({:ticket, "created_at", "2016-06-12"})

      assert search_result |> hd() |> Map.get("subject") == "A Catastrophe in Maldives"
      assert search_result |> length() == 1
    end

    test "tickets by array field(tags)" do
      {:ticket, search_result} = Repo.search({:ticket, "tags", "Mississippi"})

      assert search_result |> hd() |> Map.get("subject") == "A Drama in British Indian Ocean Territory"
      assert search_result |> length() == 14
    end

    test "tickets by boolean field(active)" do
      {:ticket, search_result} = Repo.search({:ticket, "has_incidents", "false"})
      first_ticket = search_result |> List.first()
      last_ticket = search_result |> List.last()

      assert search_result |> length() == 101
      assert first_ticket["subject"] == "A Catastrophe in Korea (North)"
      assert last_ticket["subject"] == "A Nuisance in Namibia"
    end

    test "tickets by string field(role)" do
      {:ticket, search_result} = Repo.search({:ticket, "priority", "normal"})
      first_ticket = search_result |> List.first()
      last_ticket = search_result |> List.last()

      assert search_result |> length() == 45
      assert first_ticket["subject"] == "A Catastrophe in Hungary"
      assert last_ticket["subject"] == "A Nuisance in Namibia"
    end
  end

  test ".get_available_fields" do
    fields_map = %{
      organization: ["_id", "external_id", "name", "shared_tickets",
                     "domain_names", "tags", "created_at", "url", "details"],
      ticket: ["_id", "submitter_id", "assignee_id", "organization_id",
               "type", "external_id", "has_incidents", "tags", "created_at",
               "due_at", "url", "subject", "description", "priority", "status",
               "via"],
      user: ["_id", "name", "organization_id", "external_id", "active",
             "shared", "verified", "suspended", "tags", "created_at",
             "last_login_at", "url", "alias", "locale", "timezone", "email",
             "phone", "signature", "role"]
    }

    assert Repo.get_available_fields() == fields_map
  end
end
