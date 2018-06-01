defmodule SquarestoreWeb.AdressDataController do
    use SquarestoreWeb, :controller

    alias Squarestore.Identity
    alias Squarestore.Identity.Adress

    def index(conn, _params) do
      adresses = Identity.list.adresses()
      render(conn, "index.html", adresses: adresses)
    end

    def new(conn, _params) do
      changeset = Identity.change_adress(%Adress{})
      render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"adress" => adress_params}) do
      case Identity.create_adress(adress_params) do
        {:ok, adress} ->
          conn
          |> put_flash(:info, "Adress created successfully.")
          |> redirect(to: adress_path(conn, :show, adresses))
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
      end
    end


      def show(conn, %{"id" => id}) do
        adress = Identity.get_adress!(id)
        render(conn, "show.html", adress: adress)
      end

      def edit(conn, %{"id" => id}) do
        adress = Identity.get_adress!(id)
        changeset = Identity.change_adress(adress)
        render(conn, "edit.html", adress: adress, changeset: changeset)
      end

      def update(conn, %{"id" => id, "adress" => adress_params}) do
        adress = Identity.get_adress!(id)

        case Identity.update_adress(adress, adress_params) do
          {:ok, adress} ->
            conn
            |> put_flash(:info, "Adress updated successfully.")
            |> redirect(to: adress_path(conn, :show, adress))
          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "edit.html", adress: adress, changeset: changeset)
        end
      end

      def delete(conn, %{"id" => id}) do
        adress = Identity.get_adress!(id)
        {:ok, _adress} = Identity.delete_adress(adress)

        conn
        |> put_flash(:info, "Adress deleted successfully.")
        |> redirect(to: adress_path(conn, :index))
      end
    end
