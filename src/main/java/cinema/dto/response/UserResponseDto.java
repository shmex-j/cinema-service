package cinema.dto.response;

import cinema.model.Role;
import java.util.Set;

public class UserResponseDto {
    private Long id;
    private String email;
    private Set<Role.RoleName> roles;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Role.RoleName> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role.RoleName> roles) {
        this.roles = roles;
    }
}
