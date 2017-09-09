defmodule Riko.AccountsTest do
  use Riko.DataCase

  alias Riko.Accounts

  describe "items" do
    alias Riko.Accounts.Item

    @valid_attrs %{title: "some title", url: "some url"}
    @update_attrs %{title: "some updated title", url: "some updated url"}
    @invalid_attrs %{title: nil, url: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Accounts.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Accounts.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Accounts.create_item(@valid_attrs)
      assert item.title == "some title"
      assert item.url == "some url"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Accounts.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.title == "some updated title"
      assert item.url == "some updated url"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_item(item, @invalid_attrs)
      assert item == Accounts.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Accounts.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Accounts.change_item(item)
    end
  end
end
