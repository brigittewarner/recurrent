# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Recurrent.Repo.insert!(%Recurrent.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Recurrent.Repo.delete_all Recurrent.User

Recurrent.User.changeset(%Recurrent.User{}, %{name: "Test User", email: "testuser@example.com", password: "secret", password_confirmation: "secret"})
|> Recurrent.Repo.insert!
|> Coherence.ControllerHelpers.confirm!
