package cinema.controller;

import cinema.dto.request.UserRequestDto;
import cinema.dto.response.UserResponseDto;
import cinema.model.Role;
import cinema.model.User;
import cinema.service.AuthenticationService;
import cinema.service.RoleService;
import cinema.service.mapper.ResponseDtoMapper;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthenticationController {
    private static final Role.RoleName DEFAULT_ROLE = Role.RoleName.USER;
    private final AuthenticationService authService;
    private final RoleService roleService;
    private final ResponseDtoMapper<UserResponseDto, User> userDtoResponseMapper;

    public AuthenticationController(AuthenticationService authService,
                                    RoleService roleService,
                                    ResponseDtoMapper<UserResponseDto, User>
                                            userDtoResponseMapper) {
        this.authService = authService;
        this.roleService = roleService;
        this.userDtoResponseMapper = userDtoResponseMapper;
    }

    @PostMapping("/register")
    public UserResponseDto register(@RequestBody @Valid UserRequestDto requestDto) {
        User user = authService.register(requestDto.getEmail(), requestDto.getPassword());
        Role role = roleService.getByName(DEFAULT_ROLE.name());
        user.setRoles(Set.of(role));
        return userDtoResponseMapper.mapToDto(user);
    }
}
