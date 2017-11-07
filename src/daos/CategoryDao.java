package daos;

import main.Category;

import java.io.Serializable;
import java.util.ArrayList;

public interface CategoryDao extends Serializable {

    ArrayList<Category> getCategories();
}
