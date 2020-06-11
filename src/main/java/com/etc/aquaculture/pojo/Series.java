package com.etc.aquaculture.pojo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Series {
    private String name;
    private String type = "line";
    private String stack = "总量";
    private List areaStyle = new ArrayList();
    private List<?> data;

    private label label = new label();

    public class label {
        private normal normal = new normal();
        public class normal {
            private boolean show;
            private String position;

            public boolean isShow() {
                return show;
            }

            public void setShow(boolean show) {
                this.show = show;
            }

            public String getPosition() {
                return position;
            }

            public void setPosition(String position) {
                this.position = position;
            }
        }

        public Series.label.normal getNormal() {
            return normal;
        }

        public void setNormal(Series.label.normal normal) {
            this.normal = normal;
        }
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStack() {
        return stack;
    }

    public void setStack(String stack) {
        this.stack = stack;
    }

    public List getAreaStyle() {
        return areaStyle;
    }

    public void setAreaStyle(List areaStyle) {
        this.areaStyle = areaStyle;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public Series.label getLabel() {
        return label;
    }

    public void setLabel(Series.label label) {
        this.label = label;
    }
}
