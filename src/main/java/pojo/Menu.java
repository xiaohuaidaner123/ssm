package pojo;

import java.util.List;

public class Menu {
    private String id;
    private String text;
    private String iconCls;
    private List<SysChildren> children;

    public List getChildren() {
        return children;
    }

    public void setChildren(List<SysChildren> children) {
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

}
