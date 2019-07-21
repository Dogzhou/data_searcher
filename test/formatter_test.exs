defmodule PrinterTest do
  use ExUnit.Case
  alias DataSearcher.Formatter

  describe ".to_printable_format" do
    test "resource not found" do
      assert Formatter.to_printable_format({:whatever, []}) == "No result was found, Please search again\n"
    end

    test "users" do
      users = FakeSearchResult.users()

      expected_result = """
      --------------------------------------------------
      Organization: Xylar
      Submitted Tickets:
          A Catastrophe in Moldova
          A Catastrophe in Central African Republic
          A Nuisance in Uganda
          A Catastrophe in Malta
          A Problem in Kyrgyzstan
      Assigned Tickets:
          A Nuisance in Equatorial Guinea
          A Problem in French Southern Territories
                               _id: 3
                            active: false
                             alias: Miss Buck
                        created_at: 2016-07-28T05:29:25 -10:00
                             email: buckwagner@flotonic.com
                       external_id: 85c599c1-ebab-474d-a4e6-32f1c06e8730
                     last_login_at: 2013-02-07T05:53:38 -11:00
                            locale: en-AU
                              name: Ingrid Wagner
                   organization_id: 104
                             phone: 9365-482-943
                              role: end-user
                            shared: false
                         signature: Don't Worry Be Happy!
                         suspended: false
                              tags: [Mulino, Kenwood, Wescosville, Loyalhanna]
                          timezone: Trinidad and Tobago
                               url: http://initech.zendesk.com/api/v2/users/3.json
                          verified: false
      --------------------------------------------------
      """

      assert Formatter.to_printable_format({:user, users}) == expected_result |> String.trim()
    end

    test "organizations" do
      organizations = FakeSearchResult.organizations()
      expected_result = """
      --------------------------------------------------
      Users:
          Tyler Bates
          Burgess England
          Pena Lang
          Mari Deleon
      Tickets:
          A Problem in Tonga
          A Drama in British Indian Ocean Territory
          A Nuisance in Latvia
          A Çatastrophe in Sudan
          A Catastrophe in Ecuador
          A Nuisance in Estonia
          A Nuisance in Grenada
                               _id: 113
                        created_at: 2016-04-09T08:45:29 -10:00
                           details: MegaCörp
                      domain_names: [artiq.com, mazuda.com, surelogic.com, fuelworks.com]
                       external_id: 67d9dbdb-a9c6-4a30-a003-202de05d09e2
                              name: Noralex
                    shared_tickets: true
                              tags: [Maldonado, Hebert, Poole, Mcleod]
                               url: http://initech.zendesk.com/api/v2/organizations/113.json
      --------------------------------------------------
      """

      assert Formatter.to_printable_format({:organization, organizations}) == expected_result |> String.trim()
    end

    test "tickets" do
      tickets = FakeSearchResult.tickets()
      expected_result = """
      --------------------------------------------------
      Organization: Quilk
      Submitted By: Prince Hinton
      Assigned To: Elma Castro
                               _id: 1a227508-9f39-427c-8f57-1b72f3fab87c
                       assignee_id: 38
                        created_at: 2016-04-14T08:32:31 -10:00
                       description: Aliquip excepteur fugiat ex minim ea aute eu labore. Sunt eiusmod esse eu non commodo est veniam consequat.
                            due_at: 2016-08-15T05:37:32 -10:00
                       external_id: 3e5ca820-cd1f-4a02-a18f-11b18e7bb49a
                     has_incidents: false
                   organization_id: 112
                          priority: low
                            status: hold
                           subject: A Catastrophe in Micronesia
                      submitter_id: 71
                              tags: [Puerto Rico, Idaho, Oklahoma, Louisiana]
                              type: incident
                               url: http://initech.zendesk.com/api/v2/tickets/1a227508-9f39-427c-8f57-1b72f3fab87c.json
                               via: chat
      --------------------------------------------------
      """

      assert Formatter.to_printable_format({:ticket, tickets}) == expected_result |> String.trim()
    end
  end
end
