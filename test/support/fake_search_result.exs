defmodule FakeSearchResult do
  def users do
    [
      %{
        "_id" => 3,
        "active" => false,
        "alias" => "Miss Buck",
        "assigned_tickets" => [
          %{
            "_id" => "95870a6c-22bd-45c3-8d8e-b7f2c7d46b76",
            "assignee_id" => 3,
            "created_at" => "2016-06-26T12:12:53 -10:00",
            "description" => "Labore in consequat exercitation aliqua incididunt ullamco eu veniam irure occaecat. Sunt velit aute eiusmod velit.",
            "due_at" => "2016-08-21T06:49:58 -10:00",
            "external_id" => "4a70394c-9b1a-4766-9d41-ef7f61a01a1c",
            "has_incidents" => true,
            "organization_id" => 111,
            "priority" => "high",
            "status" => "open",
            "subject" => "A Nuisance in Equatorial Guinea",
            "submitter_id" => 4,
            "tags" => ["Alaska", "Maryland", "Iowa", "North Dakota"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/95870a6c-22bd-45c3-8d8e-b7f2c7d46b76.json",
            "via" => "chat"
          },
          %{
            "_id" => "e75e6904-6536-43ea-9081-1c9f787f8682",
            "assignee_id" => 3,
            "created_at" => "2016-03-01T03:50:31 -11:00",
            "description" => "Mollit pariatur veniam quis qui veniam officia pariatur ullamco dolor esse cupidatat pariatur adipisicing. Cillum mollit cupidatat velit laborum do ut mollit.",
            "due_at" => "2016-08-04T09:28:48 -10:00",
            "external_id" => "d2d2bcdf-fc03-44b5-8fde-b093559f6695",
            "has_incidents" => true,
            "organization_id" => 116,
            "priority" => "high",
            "status" => "pending",
            "subject" => "A Problem in French Southern Territories",
            "submitter_id" => 74,
            "tags" => ["Kentucky", "North Carolina", "South Carolina", "Indiana"],
            "type" => "task",
            "url" => "http://initech.zendesk.com/api/v2/tickets/e75e6904-6536-43ea-9081-1c9f787f8682.json",
            "via" => "chat"
          }
        ],
        "created_at" => "2016-07-28T05:29:25 -10:00",
        "email" => "buckwagner@flotonic.com",
        "external_id" => "85c599c1-ebab-474d-a4e6-32f1c06e8730",
        "last_login_at" => "2013-02-07T05:53:38 -11:00",
        "locale" => "en-AU",
        "name" => "Ingrid Wagner",
        "organization" => [
          %{
            "_id" => 104,
            "created_at" => "2016-03-21T10:11:18 -11:00",
            "details" => "MegaCörp",
            "domain_names" => ["anixang.com", "exovent.com", "photobin.com",
                               "marqet.com"],
            "external_id" => "f6eb60ad-fe37-4a45-9689-b32031399f93",
            "name" => "Xylar",
            "shared_tickets" => false,
            "tags" => ["Hendricks", "Mclaughlin", "Stephens", "Garner"],
            "url" => "http://initech.zendesk.com/api/v2/organizations/104.json"
          }
        ],
        "organization_id" => 104,
        "phone" => "9365-482-943",
        "role" => "end-user",
        "shared" => false,
        "signature" => "Don't Worry Be Happy!",
        "submitted_tickets" => [
          %{
            "_id" => "c496e355-4400-4baa-b8ca-bb2edd270c43",
            "assignee_id" => 33,
            "created_at" => "2016-02-26T06:45:12 -11:00",
            "description" => "Laboris dolor aliquip adipisicing nisi amet aliqua non reprehenderit cupidatat nulla. Anim aute do cillum occaecat irure minim enim anim cupidatat incididunt proident exercitation nulla.",
            "due_at" => "2016-08-12T06:24:57 -10:00",
            "external_id" => "4cc40f31-ddd0-4324-ada8-f298531833db",
            "has_incidents" => true,
            "organization_id" => 110,
            "priority" => "urgent",
            "status" => "hold",
            "subject" => "A Catastrophe in Moldova",
            "submitter_id" => 3,
            "tags" => ["Oregon", "Arizona", "Delaware", "New Hampshire"],
            "type" => "incident",
            "url" => "http://initech.zendesk.com/api/v2/tickets/c496e355-4400-4baa-b8ca-bb2edd270c43.json",
            "via" => "voice"
          },
          %{
            "_id" => "5315f036-2bdd-4d6e-a356-fc6759c74351",
            "assignee_id" => 14,
            "created_at" => "2016-02-21T10:52:48 -11:00",
            "description" => "Adipisicing commodo ut non quis occaecat non magna id labore ipsum eu duis nostrud irure. Irure culpa aliqua tempor esse aute elit velit.",
            "due_at" => "2016-08-04T06:56:18 -10:00",
            "external_id" => "3f54d338-9781-4650-a6e8-8dece939e258",
            "has_incidents" => false,
            "organization_id" => 124,
            "priority" => "urgent",
            "status" => "open",
            "subject" => "A Catastrophe in Central African Republic",
            "submitter_id" => 3,
            "tags" => ["Minnesota", "New Jersey", "Texas", "Nevada"],
            "type" => "problem",
            "url" => "http://initech.zendesk.com/api/v2/tickets/5315f036-2bdd-4d6e-a356-fc6759c74351.json",
            "via" => "voice"
          },
          %{
            "_id" => "f75ef2ed-da4f-417c-b164-3dd2c9c8f87c",
            "assignee_id" => 43,
            "created_at" => "2016-03-29T10:53:31 -11:00",
            "description" => "Dolore culpa dolore quis incididunt sunt ea adipisicing deserunt dolore. Lorem nisi enim fugiat aute qui incididunt aliqua.",
            "due_at" => "2016-08-04T07:53:50 -10:00",
            "external_id" => "cfaaf36a-eeec-4dfa-bf04-e6a8e65eb163",
            "has_incidents" => false,
            "organization_id" => 122,
            "priority" => "normal",
            "status" => "closed",
            "subject" => "A Nuisance in Uganda",
            "submitter_id" => 3,
            "tags" => ["Virginia", "Virgin Islands", "Maine", "West Virginia"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/f75ef2ed-da4f-417c-b164-3dd2c9c8f87c.json",
            "via" => "web"
          },
          %{
            "_id" => "8d7b4d51-ef95-4923-9ab8-42332ab2188d",
            "assignee_id" => 8,
            "created_at" => "2016-05-30T02:40:22 -10:00",
            "description" => "Est consequat elit do do id laborum ad enim sit nostrud id eiusmod. Labore tempor velit cupidatat aliquip excepteur anim aliquip aliquip.",
            "due_at" => "2016-08-12T02:41:31 -10:00",
            "external_id" => "c0a785cf-b0e0-4627-acb6-97adac4b7be6",
            "has_incidents" => true,
            "organization_id" => 118,
            "priority" => "high",
            "status" => "pending",
            "subject" => "A Catastrophe in Malta",
            "submitter_id" => 3,
            "tags" => ["Virginia", "Virgin Islands", "Maine", "West Virginia"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/8d7b4d51-ef95-4923-9ab8-42332ab2188d.json",
            "via" => "voice"
          },
          %{
            "_id" => "ad49f154-2ceb-4052-9129-ddc6d4b7e479",
            "assignee_id" => 31,
            "created_at" => "2016-05-17T08:32:44 -10:00",
            "description" => "Pariatur eu ipsum esse qui. Quis minim ea deserunt enim do cupidatat velit aliqua qui duis pariatur velit consectetur.",
            "due_at" => "2016-07-31T02:59:08 -10:00",
            "external_id" => "8a57c17a-c7bc-4b1c-bfad-eec83f4a791d",
            "has_incidents" => true,
            "organization_id" => 118,
            "priority" => "high",
            "status" => "closed",
            "subject" => "A Problem in Kyrgyzstan",
            "submitter_id" => 3,
            "tags" => ["Georgia", "Tennessee", "Mississippi", "Marshall Islands"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/ad49f154-2ceb-4052-9129-ddc6d4b7e479.json",
            "via" => "voice"
          }
        ],
        "suspended" => false,
        "tags" => ["Mulino", "Kenwood", "Wescosville", "Loyalhanna"],
        "timezone" => "Trinidad and Tobago",
        "url" => "http://initech.zendesk.com/api/v2/users/3.json",
        "verified" => false
      }
    ]
  end

  def organizations do
    [
      %{
        "_id" => 113,
        "created_at" => "2016-04-09T08:45:29 -10:00",
        "details" => "MegaCörp",
        "domain_names" => ["artiq.com", "mazuda.com", "surelogic.com",
                           "fuelworks.com"],
        "external_id" => "67d9dbdb-a9c6-4a30-a003-202de05d09e2",
        "name" => "Noralex",
        "shared_tickets" => true,
        "tags" => ["Maldonado", "Hebert", "Poole", "Mcleod"],
        "tickets" => [
          %{
            "_id" => "b4875dbc-c167-4625-a1e4-d14ed409c62c",
            "assignee_id" => 31,
            "created_at" => "2016-04-22T12:55:29 -10:00",
            "description" => "Proident est ea duis eiusmod. Deserunt laboris eu cupidatat culpa tempor aliquip eu.",
            "due_at" => "2016-08-06T07:41:47 -10:00",
            "external_id" => "0a8d9bab-b265-4801-8d64-ba6cba3df967",
            "has_incidents" => false,
            "organization_id" => 113,
            "priority" => "urgent",
            "status" => "open",
            "subject" => "A Problem in Tonga",
            "submitter_id" => 73,
            "tags" => ["Michigan", "Florida", "Georgia", "Tennessee"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/b4875dbc-c167-4625-a1e4-d14ed409c62c.json",
            "via" => "voice"
          },
          %{
            "_id" => "c08537d2-116d-45ff-a6d0-60c1a7d4778f",
            "assignee_id" => 64,
            "created_at" => "2016-05-15T01:23:37 -10:00",
            "description" => "Ut in minim ea ipsum anim nostrud in et aliqua. Magna est tempor sit do deserunt nostrud non fugiat Lorem officia Lorem dolore ullamco.",
            "due_at" => "2016-08-06T07:35:44 -10:00",
            "external_id" => "0f534118-467e-438f-9cfd-fad0fe4a0b1e",
            "has_incidents" => true,
            "organization_id" => 113,
            "priority" => "normal",
            "status" => "pending",
            "subject" => "A Drama in British Indian Ocean Territory",
            "submitter_id" => 65,
            "tags" => ["Mississippi", "Marshall Islands", "South Dakota",
                       "Montana"],
            "type" => "task",
            "url" => "http://initech.zendesk.com/api/v2/tickets/c08537d2-116d-45ff-a6d0-60c1a7d4778f.json",
            "via" => "chat"
          },
          %{
            "_id" => "6aac0369-a7e5-4417-8b50-92528ef485d3",
            "assignee_id" => 29,
            "created_at" => "2016-06-15T12:03:55 -10:00",
            "description" => "Laboris laborum culpa sit culpa minim ad laborum Lorem laboris aliqua tempor. Aliqua sit nisi deserunt eu quis ipsum incididunt aute excepteur cillum.",
            "due_at" => "2016-08-16T05:52:08 -10:00",
            "external_id" => "0c2ba6c6-ea9a-4a58-ada4-bc72f3b9ff39",
            "has_incidents" => false,
            "organization_id" => 113,
            "priority" => "urgent",
            "status" => "hold",
            "subject" => "A Nuisance in Latvia",
            "submitter_id" => 50,
            "tags" => ["Washington", "Wyoming", "Ohio", "Pennsylvania"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/6aac0369-a7e5-4417-8b50-92528ef485d3.json",
            "via" => "chat"
          },
          %{
            "_id" => "4eea5790-b490-4dee-877f-808d86cbd1a8",
            "assignee_id" => 73,
            "created_at" => "2016-02-26T06:34:34 -11:00",
            "description" => "Lorem quis culpa eiusmod culpa eu. Aute ullamco anim nostrud consequat consequat ipsum aliquip ipsum.",
            "due_at" => "2016-07-31T06:51:48 -10:00",
            "external_id" => "c6250ca2-1098-426b-b274-9202dc4cae50",
            "has_incidents" => false,
            "organization_id" => 113,
            "priority" => "low",
            "status" => "pending",
            "subject" => "A Çatastrophe in Sudan",
            "submitter_id" => 66,
            "tags" => ["New Mexico", "Nebraska", "Connecticut", "Arkansas"],
            "type" => "problem",
            "url" => "http://initech.zendesk.com/api/v2/tickets/4eea5790-b490-4dee-877f-808d86cbd1a8.json",
            "via" => "web"
          },
          %{
            "_id" => "34cf9dc4-c0a2-4925-b579-1a9c65efa488",
            "assignee_id" => 40,
            "created_at" => "2016-03-17T08:04:05 -11:00",
            "description" => "Est ea voluptate ex ullamco est laboris exercitation dolor deserunt est esse aute Lorem et. Exercitation ut officia sint esse exercitation Lorem.",
            "due_at" => "2016-08-23T02:39:42 -10:00",
            "external_id" => "12ccfd3b-0aaf-4c19-bacb-6d999c4fc5b0",
            "has_incidents" => false,
            "organization_id" => 113,
            "priority" => "urgent",
            "status" => "closed",
            "subject" => "A Catastrophe in Ecuador",
            "submitter_id" => 56,
            "tags" => ["Massachusetts", "New York", "Minnesota", "New Jersey"],
            "type" => "question",
            "url" => "http://initech.zendesk.com/api/v2/tickets/34cf9dc4-c0a2-4925-b579-1a9c65efa488.json",
            "via" => "voice"
          },
          %{
            "_id" => "1fcfe2d4-ba1d-45a9-8cbb-3af610f3a673",
            "assignee_id" => 15,
            "created_at" => "2016-07-05T05:19:42 -10:00",
            "description" => "Occaecat magna ea excepteur nulla cupidatat nostrud elit magna cillum sint esse laboris. Aliquip commodo excepteur tempor excepteur nisi sit consequat enim deserunt sit qui adipisicing cupidatat pariatur.",
            "due_at" => "2016-08-09T05:54:01 -10:00",
            "external_id" => "f35621fc-3e87-4b4d-8449-1f15b7945105",
            "has_incidents" => false,
            "organization_id" => 113,
            "priority" => "high",
            "status" => "closed",
            "subject" => "A Nuisance in Estonia",
            "submitter_id" => 42,
            "tags" => ["Oregon", "Arizona", "Delaware", "New Hampshire"],
            "type" => "problem",
            "url" => "http://initech.zendesk.com/api/v2/tickets/1fcfe2d4-ba1d-45a9-8cbb-3af610f3a673.json",
            "via" => "chat"
          },
          %{
            "_id" => "e804d348-2317-43b2-882a-b29d1a8acc94",
            "assignee_id" => 59,
            "created_at" => "2016-07-05T07:25:54 -10:00",
            "description" => "Sunt do mollit deserunt do fugiat. Id Lorem voluptate officia do.",
            "due_at" => "2016-08-06T03:25:46 -10:00",
            "external_id" => "93b1c5a2-3811-464e-9091-77432a8599fc",
            "has_incidents" => false,
            "organization_id" => 113,
            "priority" => "urgent",
            "status" => "solved",
            "subject" => "A Nuisance in Grenada",
            "submitter_id" => 35,
            "tags" => ["South Dakota", "Montana", "District Of Columbia",
                       "Wisconsin"],
            "type" => "problem",
            "url" => "http://initech.zendesk.com/api/v2/tickets/e804d348-2317-43b2-882a-b29d1a8acc94.json",
            "via" => "chat"
          }
        ],
        "url" => "http://initech.zendesk.com/api/v2/organizations/113.json",
        "users" => [
          %{
            "_id" => 17,
            "active" => true,
            "alias" => "Miss Myra",
            "created_at" => "2016-01-05T10:55:04 -11:00",
            "email" => "myrabates@flotonic.com",
            "external_id" => "d450d3dd-ef44-40a3-8c1b-dd8dcbad26d1",
            "last_login_at" => "2016-08-12T03:24:16 -10:00",
            "name" => "Tyler Bates",
            "organization_id" => 113,
            "phone" => "8905-642-934",
            "role" => "admin",
            "shared" => false,
            "signature" => "Don't Worry Be Happy!",
            "suspended" => true,
            "tags" => ["Snelling", "Fontanelle", "Dowling", "Conestoga"],
            "timezone" => "Estonia",
            "url" => "http://initech.zendesk.com/api/v2/users/17.json",
            "verified" => false
          },
          %{
            "_id" => 40,
            "active" => true,
            "alias" => "Mr Neal",
            "created_at" => "2016-07-16T09:13:47 -10:00",
            "email" => "nealengland@flotonic.com",
            "external_id" => "e79e166e-fcb5-4604-9466-1ea9777c6eb5",
            "last_login_at" => "2015-10-20T01:25:19 -11:00",
            "locale" => "zh-CN",
            "name" => "Burgess England",
            "organization_id" => 113,
            "phone" => "9675-282-161",
            "role" => "end-user",
            "shared" => true,
            "signature" => "Don't Worry Be Happy!",
            "suspended" => true,
            "tags" => ["Riceville", "Ribera", "Caberfae", "Breinigsville"],
            "timezone" => "Taiwan",
            "url" => "http://initech.zendesk.com/api/v2/users/40.json",
            "verified" => false
          },
          %{
            "_id" => 53,
            "active" => false,
            "alias" => "Miss Middleton",
            "created_at" => "2016-02-24T05:40:40 -11:00",
            "email" => "middletonlang@flotonic.com",
            "external_id" => "99006a7e-3279-416d-a2f2-d92aca820ec0",
            "last_login_at" => "2014-03-03T08:54:37 -11:00",
            "locale" => "en-AU",
            "name" => "Pena Lang",
            "organization_id" => 113,
            "phone" => "9174-113-995",
            "role" => "end-user",
            "shared" => false,
            "signature" => "Don't Worry Be Happy!",
            "suspended" => false,
            "tags" => ["Roderfield", "Lemoyne", "Grantville", "Fredericktown"],
            "timezone" => "Liechtenstein",
            "url" => "http://initech.zendesk.com/api/v2/users/53.json",
            "verified" => true
          },
          %{
            "_id" => 57,
            "active" => true,
            "alias" => "Mr Caitlin",
            "created_at" => "2016-06-10T01:38:38 -10:00",
            "email" => "caitlindeleon@flotonic.com",
            "external_id" => "cc91aaa0-49af-42aa-9a85-0278fee1a96c",
            "last_login_at" => "2014-04-21T08:53:02 -10:00",
            "locale" => "zh-CN",
            "name" => "Mari Deleon",
            "organization_id" => 113,
            "phone" => "8645-272-680",
            "role" => "admin",
            "shared" => false,
            "signature" => "Don't Worry Be Happy!",
            "suspended" => false,
            "tags" => ["Blodgett", "Nicut", "Smock", "Finzel"],
            "timezone" => "Guatemala",
            "url" => "http://initech.zendesk.com/api/v2/users/57.json",
            "verified" => true
          }
        ]
      }
    ]
  end

  def tickets do
    [
      %{
        "_id" => "1a227508-9f39-427c-8f57-1b72f3fab87c",
        "assignee" => [
          %{
            "_id" => 38,
            "active" => false,
            "alias" => "Mr Georgette",
            "created_at" => "2016-01-31T02:46:05 -11:00",
            "email" => "georgettecastro@flotonic.com",
            "external_id" => "72c7ba23-e070-4583-b701-04a038a28b02",
            "last_login_at" => "2012-12-20T01:48:00 -11:00",
            "locale" => "en-AU",
            "name" => "Elma Castro",
            "organization_id" => 114,
            "phone" => "8364-062-708",
            "role" => "agent",
            "shared" => true,
            "signature" => "Don't Worry Be Happy!",
            "suspended" => true,
            "tags" => ["Colton", "Williamson", "Marshall", "Charco"],
            "timezone" => "Gibraltar",
            "url" => "http://initech.zendesk.com/api/v2/users/38.json",
            "verified" => false
          }
        ],
        "assignee_id" => 38,
        "created_at" => "2016-04-14T08:32:31 -10:00",
        "description" => "Aliquip excepteur fugiat ex minim ea aute eu labore. Sunt eiusmod esse eu non commodo est veniam consequat.",
        "due_at" => "2016-08-15T05:37:32 -10:00",
        "external_id" => "3e5ca820-cd1f-4a02-a18f-11b18e7bb49a",
        "has_incidents" => false,
        "organization" => [
          %{
            "_id" => 112,
            "created_at" => "2016-01-10T03:21:25 -11:00",
            "details" => "MegaCorp",
            "domain_names" => ["valreda.com", "strozen.com", "signity.com",
                               "quantasis.com"],
            "external_id" => "32e979ff-47b4-43b9-8b74-eea1227905d9",
            "name" => "Quilk",
            "shared_tickets" => false,
            "tags" => ["Hall", "Dorsey", "Shepard", "Carter"],
            "url" => "http://initech.zendesk.com/api/v2/organizations/112.json"
          }
        ],
        "organization_id" => 112,
        "priority" => "low",
        "status" => "hold",
        "subject" => "A Catastrophe in Micronesia",
        "submitter" => [
          %{
            "_id" => 71,
            "active" => true,
            "alias" => "Miss Dana",
            "created_at" => "2016-04-18T11:05:43 -10:00",
            "email" => "danahinton@flotonic.com",
            "external_id" => "c972bb41-94aa-4f20-bc93-e63dbfe8d9ca",
            "last_login_at" => "2013-05-01T01:18:48 -10:00",
            "locale" => "zh-CN",
            "name" => "Prince Hinton",
            "organization_id" => 121,
            "phone" => "9064-433-892",
            "role" => "agent",
            "shared" => false,
            "signature" => "Don't Worry Be Happy!",
            "suspended" => false,
            "tags" => ["Davenport", "Cherokee", "Summertown", "Clinton"],
            "timezone" => "Samoa",
            "url" => "http://initech.zendesk.com/api/v2/users/71.json",
            "verified" => false
          }
        ],
        "submitter_id" => 71,
        "tags" => ["Puerto Rico", "Idaho", "Oklahoma", "Louisiana"],
        "type" => "incident",
        "url" => "http://initech.zendesk.com/api/v2/tickets/1a227508-9f39-427c-8f57-1b72f3fab87c.json",
        "via" => "chat"
      }
    ]
  end
end
