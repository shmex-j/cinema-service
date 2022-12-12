package cinema.dao.impl;

import cinema.dao.AbstractDao;
import cinema.dao.RoleDao;
import cinema.exception.DataProcessingException;
import cinema.model.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl extends AbstractDao<Role> implements RoleDao {
    public RoleDaoImpl(SessionFactory factory) {
        super(factory, Role.class);
    }

    @Override
    public Role getByName(String roleNameString) {
        try (Session session = factory.openSession()) {
            Role.RoleName roleName = Role.RoleName.valueOf(roleNameString);
            Query<Role> findByName = session.createQuery(
                    "SELECT r FROM Role r "
                            + "WHERE r.name = :name", Role.class);
            findByName.setParameter("name", roleName);
            return findByName.uniqueResult();
        } catch (Exception e) {
            throw new DataProcessingException("Role with name " + roleNameString + " not found", e);
        }
    }
}
